class AddNumberOfPartToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :number_of_parts, :integer, default: 1, null: false
  end
end
