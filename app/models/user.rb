class User < ApplicationRecord
  belongs_to :flat, optional: true
  has_many :comments, dependent: :destroy
  has_many :user_expenses, dependent: :destroy
  has_many :expenses, through: :user_expenses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
end
