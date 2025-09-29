# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

admin = User.create!(name: "Admin", email: "admin@example.com", password: "password123", password_confirmation: "password123", role: :admin)
user1 = User.create!(name: "Alice", email: "alice@example.com", password: "password123", password_confirmation: "password123", role: :user)
user2 = User.create!(name: "Bob", email: "bob@example.com", password: "password123", password_confirmation: "password123", role: :user)

p1 = user1.posts.create!(title: "Hello World", body: "This is my first post")
p2 = user2.posts.create!(title: "Another Post", body: "Content here")

c1 = p1.comments.create!(user: user2, body: "Nice post!")
c2 = p2.comments.create!(user: user1, body: "Good job")

# likes
user1.likes.create!(likeable: p2)
user2.likes.create!(likeable: p1)
admin.likes.create!(likeable: c1)

