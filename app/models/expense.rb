class Expense < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :flat
  has_many :user_expenses, dependent: :destroy
  has_many :users, through: :user_expenses
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  CATEGORIES = %w(Shopping Pets Utilities Others)

  validates :description, length: { maximum: 400 }
  validates :category, inclusion: { in: CATEGORIES }
  validates :amount, numericality: { only_integer: true }, presence: true

  def self.map_cat_to_color(cat)
    ["#223FD2", "#BA22D2", "#F8B91A", "#EC5B2D"][CATEGORIES.index(cat)]
  end
end
