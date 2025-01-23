class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy
  validates :name, presence: true
  validates :category_type, inclusion: { in: ['income', 'expense'] }
end
