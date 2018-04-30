if Rails.env.development?
  union1 = Union.create(name: 'Test Union 1')
  union2 = Union.create(name: 'Test Union 2')

  division1 = Division.create(name: 'Test Division 1')
  division2 = Division.create(name: 'Test Division 2')

  position1 = Position.create(name: 'Test Position 1', union: union1)
  position2 = Position.create(name: 'Test Position 2', union: union2)

  supervisor = User.create(first_name: 'Test', last_name: 'Supervisor',
                           email: 'supervisor@test.com',
                           spire_id: '00000001',
                           position: position1,
                           division: division1,
                           is_supervisor: true)
  user1 = User.create(first_name: 'Test', last_name: 'User 1',
                      email: 'user1@test.com',
                      spire_id: '00000002',
                      position: position1,
                      division: division2,
                      supervisor: supervisor)
  user2 = User.create(first_name: 'Test', last_name: 'User 2',
                      email: 'user2@test.com',
                      spire_id: '00000003',
                      position: position2,
                      division: division1,
                      supervisor: supervisor)

  Shift.create(start_time: Time.now, end_time: Time.now+1.hour, user: user1)
  Shift.create(start_time: Time.now+4.hour, end_time: Time.now+7.hour, user: user1)
  Shift.create(start_time: Time.now+36.hour, end_time: Time.now+38.hour, user: user1)
  Shift.create(start_time: Time.now+52.hour, end_time: Time.now+60.hour, user: user1)
  Shift.create(start_time: Time.now-36.hour, end_time: Time.now-28.hour, user: user2)
  Shift.create(start_time: Time.now-10.hour, end_time: Time.now-7.hour, user: user2)
  Shift.create(start_time: Time.now, end_time: Time.now+4.hour, user: user2)
  Shift.create(start_time: Time.now+24.hour, end_time: Time.now+28.hour, user: user2)
end
