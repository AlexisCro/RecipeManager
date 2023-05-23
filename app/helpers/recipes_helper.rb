module RecipesHelper
    def format_select_type
        Recipe.kinds.keys.map do |key|
            [
                I18n.t("new.types.#{key}"),
                key
            ]
        end.delete_if { |array| array.include? "blank"}
    end
end
