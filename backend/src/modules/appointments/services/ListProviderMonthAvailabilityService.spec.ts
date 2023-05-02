import FakeAppointmentRepository from '../repositories/FakeAppointmentsRepository';
import ListProviderMonthAvailabilityService from './ListProviderMonthAvailabilityService';

let fakeAppointmentRepository: FakeAppointmentRepository;
let listProviderMonthAvailability: ListProviderMonthAvailabilityService;

describe('ListProviderMonthAvailability', () => {
  beforeEach(() => {
    fakeAppointmentRepository = new FakeAppointmentRepository();
    listProviderMonthAvailability = new ListProviderMonthAvailabilityService(
      fakeAppointmentRepository,
    );
  });

  it('should be able to list the month availability from provider', async () => {
    const year = new Date().getFullYear() + 1;

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 8, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 9, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 10, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 11, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 12, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 13, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 14, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 15, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 16, 0, 0),
      user_id: 'user-id',
    });

    await fakeAppointmentRepository.create({
      provider_id: 'provider-id',
      date: new Date(year, 4, 20, 17, 0, 0),
      user_id: 'user-id',
    });

    const availability = await listProviderMonthAvailability.execute({
      provider_id: 'provider-id',
      year,
      month: 5,
    });

    expect(availability).toEqual(
      expect.arrayContaining([
        { day: 19, available: true },
        { day: 20, available: false },
        { day: 21, available: true },
        { day: 22, available: true },
      ]),
    );
  });
});
