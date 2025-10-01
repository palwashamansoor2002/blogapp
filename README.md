# README
📖 BlogApp

A blogging platform built with Ruby on Rails, featuring user authentication, posts, comments, likes, and an admin dashboard for managing content.

🚀 Project Setup

Clone the repository and install dependencies:

git clone <your_repo_url>
cd blogapp
bundle install
rails db:setup
rails server


Visit the app at: http://localhost:3000


🛠 Tech Stack

Ruby on Rails – Backend framework

PostgreSQL / SQLite – Database

Devise – Authentication

Pundit (optional) – Authorization

TailwindCSS – Styling

Letter Opener – Local email previews

✨ Features
👤 Users

Sign up, login, logout (Devise)

User roles: admin and regular user

📝 Posts

Create, edit, delete posts (authenticated users)

View posts publicly

💬 Comments

Add comments to posts

Only logged-in users can comment

❤️ Likes

Like/unlike posts

Prevent duplicate likes with validation

🛡️ Admin Dashboard

Admin-only access

Manage all posts (create, edit, delete)

posts count




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
