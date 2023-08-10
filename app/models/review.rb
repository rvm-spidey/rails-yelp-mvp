class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true

  validates :rating, inclusion: { in: (0..5) }

  # `ref` has to be will be converted to an `Integer` if if passed as a `Float`
  validates :rating, numericality: { only_integer: true }
end
