class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :payments, foreign_key: 'category_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
