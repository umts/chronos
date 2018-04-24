# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Test users
User.create(first_name: 'Test',
            last_name: 'Name',
            spire_id: 12345678,
            email: 'test@example.com',
            is_supervisor: false)
User.create(first_name: 'Supervisor',
            last_name: 'Name',
            spire_id: 11111111,
            email: 'supervisor@example.com',
            is_supervisor: true)

# Test request types
RequestType.create(code: 'FSK', description: 'Family Sick')
