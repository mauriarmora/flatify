class Expense < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :flat
  has_many :user_expenses, dependent: :destroy
  has_many :users, through: :user_expenses
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  CATEGORIES = %w(Compras Mascotas Servicios Otros)
  MONTHS = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto",
      "Septiembre", "Octubre", "Noviembre", "Diciembre"]

  validates :description, length: { maximum: 400 }
  validates :category, inclusion: { in: CATEGORIES }
  validates :amount, numericality: { only_float: true }, presence: true

  def self.map_cat_to_color(cat)
    ["#00ABE7", "#FF707A", "#E9CD72", "#D39CD3"][CATEGORIES.index(cat)]
  end

  def individual_expense
    amount / users.count
  end
end
