# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Test users
test_user = User.create(first_name: 'Test',
                        last_name: 'Name',
                        spire_id: 12345678,
                        email: 'test@example.com')
medium_boss = User.create(first_name: 'Medium',
                          last_name: 'Boss',
                          spire_id: 11111111,
                          email: 'mediumboss@example.com')
big_boss = User.create(first_name: 'Big',
                       last_name: 'Boss',
                       spire_id: 11111112,
                       email: 'bigboss@example.com')

test_user.supervisors << medium_boss
medium_boss.supervisors << big_boss

# Test request types
RequestType.create(code: 'FSK', description: 'Family Sick')

# Test request statuses
['approved', 'pending', 'rejected'].each do |d|
  RequestStatus.create(description: d)
end
