class User < ApplicationRecord
  belongs_to :flat, optional: true
  has_one :property, foreign_key: "user_id", class_name: "Flat", dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :user_expenses, dependent: :destroy
  has_many :expenses, through: :user_expenses
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  DEFAULT_AVATAR = 'https://res.cloudinary.com/dinkluxtp/image/upload/v1601458419/default-avatar-profile-trendy-style-social-media-user-icon-187599373_hkike6.jpg'

  def photo_url
    if photo.attached?
      photo.service_url
    else
      User::DEFAULT_AVATAR
    end
  end

  def filter_by_expense_month(month)
    flat_expenses.where('expenses.payment_month = ?', month.capitalize)
  end

  def flat_expenses
    expenses.where(flat: flat)
  end

  def month_total_expenses(month)
    monthly_expenses = filter_by_expense_month(month)

    monthly_expenses.reduce(0) { |acc, expense| acc += expense.individual_expense }
  end
end
