class Entry < ApplicationRecord
  belongs_to :subcategory
  validates :amount, presence: true, numericality: true
  validates :entry_type, inclusion: { in: ['income', 'expense'] }
  validates :date, presence: true
end
