class Flat < ApplicationRecord
  has_many :users
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
  has_many :expenses, dependent: :destroy
 

  validates :name, presence: true
end