db.createUser({
  user: "db-user",
  pwd: "super-secret-password",
  roles: [ { role: "dbOwner", db: "realestate" } ]
})

db.users.insert({
  name: "db-user"
})
