if Rails.env.development?
  union1 = Union.create(name: 'Test Union 1')
  union2 = Union.create(name: 'Test Union 2')

  division1 = Division.create(name: 'Test Division 1')
  division2 = Division.create(name: 'Test Division 2')

  position1 = Position.create(name: 'Test Position 1', union: union1)
  position2 = Position.create(name: 'Test Position 2', union: union2)

  RequestType.create(code: 'FSK', description: 'Family Sick')

  ['approved', 'pending', 'rejected'].each do |d|
    RequestStatus.create(description: d)
  end

  boss = User.create(first_name: 'Test', last_name: 'Boss',
                     email: 'boss@test.com',
                     spire_id: '00000004',
                     position: position1,
                     division: division1,
                     king: true)

  supervisor = User.create(first_name: 'Test', last_name: 'Supervisor',
                           email: 'supervisor@test.com',
                           spire_id: '00000001',
                           position: position1,
                           division: division1)
  user1 = User.create(first_name: 'Test', last_name: 'User 1',
                      email: 'user1@test.com',
                      spire_id: '00000002',
                      position: position1,
                      division: division2)
  user2 = User.create(first_name: 'Test', last_name: 'User 2',
                      email: 'user2@test.com',
                      spire_id: '00000003',
                      position: position2,
                      division: division1)

  user1.supervisors << supervisor
  user2.supervisors << supervisor
  supervisor.supervisors << boss


  # generate shifts for the last 4 weeks
  [boss, supervisor, user1, user2].each do |user|
    ((Date.today-28.days)..Date.today).each do |date|
      unless date.saturday? || date.sunday?
        start_time = date.to_time + 6.hours + rand(3*60).minutes # start at 6AM - 9AM
        end_time = start_time + 2.hours + rand(6*60).minutes # 2 to 8 hours long
        Shift.create(start_time: start_time, end_time: end_time, user: user)
      end
    end
  end
end
