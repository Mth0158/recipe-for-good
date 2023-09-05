class Ingredient < ApplicationRecord
  FEATURED = %w[
    carrot
    chicken
    eggplant
    eggs
    milk
    olive\ oil
    onion
    potatoes
    tomatoes
    white\ flour
    white\ rice
    zucchini
  ].freeze

  validates :name,
    presence: true,
    uniqueness: true
  validates :is_featured,
    inclusion: [true, false]

  before_create :set_is_featured

  scope :featured, -> { where(is_featured: true) }

  private

  def set_is_featured
    self.is_featured = FEATURED.include?(name&.downcase)
  end
end
