class Ingredient < ApplicationRecord

  belongs_to :recipe

  PARAMS = %i[
    name
    unity
    quantity
    recipe_id
  ].freeze
end
