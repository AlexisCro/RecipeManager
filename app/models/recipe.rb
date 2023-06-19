class Recipe < ApplicationRecord

  belongs_to :cookbook

  has_many :ingredients
  has_many :instructions

  PARAMS = %i[
    name
    kind
    is_vegetarian
    is_vegan
    is_kids_friendly
    number_of_parts
    cookbook_id
  ].freeze

  enum kind: {
    blank: 0,
    entry: 10,
    main: 20,
    sweet: 30
  }
end
