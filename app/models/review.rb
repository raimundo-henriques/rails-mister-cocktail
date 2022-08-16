class Review < ApplicationRecord
  belongs_to :cocktail

  validates :rating, inclusion: { in: (0..5) }
end
