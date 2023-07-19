module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def apply_filters(params, filter_params = self::FILTER_PARAMS)
      all.then do |collection|
        filter_params.
          select { |param, _scope| params[param].present? }.
          each { |param, scope| collection = collection.public_send(scope, params[param]) }

        collection
      end
    end
  end
end