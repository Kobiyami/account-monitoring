class Year < ApplicationRecord
  validates :year, presence: true, numericality: { only_integer: true }
  validates :archived, inclusion: { in: [true, false] }
end
