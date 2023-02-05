FROM alpine

WORKDIR /app
ARG TERRAFORM_VERSION

ENV TFENV_URL=https://github.com/tfutils/tfenv/archive/refs/tags/v3.0.0.tar.gz

RUN apk add --quiet --update --no-cache \
    bash \
    bash-completion \
    bash-doc \
    bind-tools \
    curl \
    grep \
    git \
    jq \
    openssh-client \
    openssl \
    tar \
    util-linux \
    vim \
    musl-dev \
    libffi-dev \
    openssl-dev \
    make \
    gcc

RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*

RUN aws --version  
RUN pip install cffi
RUN pip install ansible

RUN curl -s -L ${TFENV_URL} \
    -o /tmp/tfenv.tar.gz \
    && cd /tmp \
    && tar xzf tfenv.tar.gz \
    && ln -s /tmp/tfenv-3.0.0/bin/terraform /usr/bin/terraform \
    && ln -s /tmp/tfenv-3.0.0/bin/tfenv /usr/bin/tfenv \
    && tfenv install ${TERRAFORM_VERSION}