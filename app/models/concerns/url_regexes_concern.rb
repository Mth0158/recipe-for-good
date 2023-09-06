require "active_support/concern"

module UrlRegexesConcern
  extend ActiveSupport::Concern

  # Regex from https://uibakery.io/regex-library/url
  VALID_URL_REGEX = /\Ahttps?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)\z/
end
