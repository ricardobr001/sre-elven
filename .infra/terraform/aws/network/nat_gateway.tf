locals {
  az_count  = 2
}

resource "aws_eip" "gw" {
  count      = local.az_count
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = local.az_count
  subnet_id     = element([aws_subnet.subnet_AZ_A_public.id,aws_subnet.subnet_AZ_B_public.id], count.index)
  allocation_id = element(aws_eip.gw.*.id, count.index)

  depends_on    = [aws_internet_gateway.igw]
}