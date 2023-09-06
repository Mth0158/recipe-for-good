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
end
