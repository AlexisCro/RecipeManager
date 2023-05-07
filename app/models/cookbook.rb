class Cookbook < ApplicationRecord
  belongs_to :user

  PARAMS = %i[
    title
  ].freeze
end
