class Flat < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
  has_many :expenses, dependend: :destroy
end
