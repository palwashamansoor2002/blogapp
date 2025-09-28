class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { user: 0, admin: 1 }
  validates :email, uniqueness: true
  validates :name, presence: true
  validate :password_complexity

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,:confirmable, :lockable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy 

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
