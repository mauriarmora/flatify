class User < ApplicationRecord
  belongs_to :flat, optional: true
  has_many :comments, dependent: :destroy
  has_many :user_expenses, dependent: :destroy
  has_many :expenses, through: :user_expenses
  has_one_attached :photo
  has_one :property, foreign_key: "user_id", class_name: "Flat", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def photo_url
    if photo.attached?
      photo.service_url
    else
      'https://res.cloudinary.com/dinkluxtp/image/upload/v1600952449/default_avatar_lx6rcs.png'
    end
  end

  def filter_by_expense_month(month)
    flat_expenses.where('expenses.payment_month = ?', month.capitalize)
  end

  def flat_expenses
    expenses.where(flat: flat)
  end
  # def current_month_total_expenses
  #   monthly_expenses = filter_by_expense_month(Date.today.strftime('%B'))

  #   monthly_expenses.reduce(0) { |acc, expense| acc += expense.individual_expense }
  # end

  def month_total_expenses(month)
    monthly_expenses = filter_by_expense_month(month)

    monthly_expenses.reduce(0) { |acc, expense| acc += expense.individual_expense }
  end
end
