class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false, defaut: "title"
      t.integer :kind, null: false, default: 0
      t.json :ingredients, null: false, default: {}
      t.boolean :is_vegetarian, null: false, default: false
      t.boolean :is_vegan, null: false, default: false
      t.boolean :is_kids_friendly, null: false, default: false
      t.integer :cookbook_id, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
