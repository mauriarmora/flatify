class Flat < ApplicationRecord
  has_many :users, dependent: :nullify
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
  has_many :expenses, dependent: :destroy


  validates :name, presence: true
end
