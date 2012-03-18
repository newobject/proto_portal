# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RoleNavNode.delete_all
NavNode.delete_all
UserAppRole.delete_all
App.delete_all
User.delete_all
Role.delete_all


free_role = Role.create!(name: 'Free User')
micro_role = Role.create!(name: 'Micro User')
standard_role = Role.create!(name: 'Standard User')
pro_role = Role.create!(name: 'Pro User')

free_user = User.create!(
  email: 'bo.zhang.free@yottaa.com',
  password: '000000'
)

pro_user = User.create!(
  email: 'bo.zhang.pro@yottaa.com',
  password: '000000'
)

(1..2).each do |app_i|
  app = App.create!(
    name: "app#{app_i}",
    code: "4a3b4b7eefcdd70#{app_i}",
    secret: "a5e58cc0318eb3a3c48b951a3b08681#{app_i}",
    domain: "http://localhost:300#{app_i}"
  )
  
  if app_i == 1
    UserAppRole.create!(
      user_id: free_user.id,
      app_id: app.id,
      role_id: free_role.id
    )
  end
  
  UserAppRole.create!(
    user_id: pro_user.id,
    app_id: app.id,
    role_id: pro_role.id
  )
  
  (1..3).each do |nav_node_i|
    nav_node = NavNode.create!(
      name: "app#{app_i} - nav node#{nav_node_i}",
      url: "/home?msg=app#{app_i}_nav_node#{nav_node_i}",
      app_id: app.id
    )
    
    if nav_node_i == 1
      role_nav_node = RoleNavNode.create!(
        role_id: free_role.id,
        nav_node_id: nav_node.id
      )
    end
    
    RoleNavNode.create!(
      role_id: pro_role.id,
      nav_node_id: nav_node.id
    )
  end
  
end
