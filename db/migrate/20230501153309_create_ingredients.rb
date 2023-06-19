class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unity, null: false, default: "gr"
      t.integer :quantity, null: false, default: 0
      t.integer :recipe_id, index: { unique: false }, foreign_key: true
      
      t.timestamps
    end
  end
end
