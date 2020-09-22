class Comment < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  validates :content, presence: true
  validates :content, length: { minimum: 25, maximum: 10 }
end
