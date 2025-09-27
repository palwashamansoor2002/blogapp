class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { user: 0, moderator: 1, admin: 2 }
  validates :email, uniqueness: true
  validate :password_complexity
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,:confirmable
      

  def password_complexity
    return if password.blank?

    if password.length < 10
      errors.add(:password, "must be at least 10 characters long")
    end

    if password.match?(/\s/)
      errors.add(:password, "cannot contain spaces")
    end
  end
end
