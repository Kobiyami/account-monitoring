class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :entries, dependent: :destroy
  validates :name, presence: true
end
