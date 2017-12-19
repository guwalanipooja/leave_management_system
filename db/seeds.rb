# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#roles = Role.create([{name: 'Employee'},{name: 'Manager'}])
#user = User.create(email: 'guwalanipooja@yahoo.co.in', password: 'pooja@123', first_name: 'Pooja', last_name: 'Guwalani', username: 'guwalanipooja', roles: roles)

Role.create(name: :manager)
Role.create(name: :employee)

user1 = User.create(username: 'Manager1', email: 'guwalanipooja@gmail.com', password: '123456', first_name: 'Pooja', last_name: 'Guwalani', :roles => Role.where(:name => 'manager'))

user2 = User.create(username: 'Employee1', email: 'guwalanipriya@yahoo.co.in', password: '123456', first_name: 'Priya', last_name: 'Guwalani', parent_id: user1.id, :roles => Role.where(:name => 'employee'))

user3 = User.create(username: 'Employee2', email: 'guwalanikomal@yahoo.co.in', password: '123456', first_name: 'Komal', last_name: 'Guwalani', parent_id: user1.id, :roles => Role.where(:name => 'employee'))
