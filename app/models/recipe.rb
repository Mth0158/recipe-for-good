class Recipe < ApplicationRecord
  include UrlRegexesConcern

  validates :title,
    presence: true
  validates :cook_time,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    }
  validates :prep_time,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    }
  validates :ingredients,
    presence: true
  validates :rating,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 5
    }
  validates :image_url,
    presence: true,
    format: {
      with: VALID_URL_REGEX
    }
  validates :is_vegetarian,
    inclusion: [true, false]

  before_create :set_is_vegetarian

  scope :vegetarian, -> { where(is_vegetarian: true) }

  private

  def set_is_vegetarian
    self.is_vegetarian = ingredients.none? do |ingredient|
      ingredient.match?(/beef|pork|lamb|venison|bison|veal|duck|sausage|meat|chicken|lard|turkey|bacon|ham|ground/i)
    end
  end
end
