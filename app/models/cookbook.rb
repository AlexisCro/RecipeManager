class Cookbook < ApplicationRecord

    belongs_to :user

    has_many :recipes

    PARAMS = %i[
        title
    ].freeze
end