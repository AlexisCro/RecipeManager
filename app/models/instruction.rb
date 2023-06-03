class Instruction < ApplicationRecord
  belongs_to :recipe

  PARAMS = %i[
    number_of_step
    description
    recipe_id
  ].freeze
end
