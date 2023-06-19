module RecipesHelper
  def format_select_type
    Recipe.kinds.keys.map do |key|
      [
        I18n.t("new.types.#{key}"),
         key
      ]
    end.delete_if { |array| array.include? "blank"}
  end

  def display_logo_vegan(recipe)
    image_tag 'plate_state/vegan.png' if recipe.is_vegan?
  end

  def display_logo_vegetarian(recipe)
    image_tag 'plate_state/vegetarian.png' if recipe.is_vegetarian?
  end

  def display_logo_kids_friendly(recipe)
    image_tag 'plate_state/kids-friendly.png' if recipe.is_kids_friendly?
  end
end
