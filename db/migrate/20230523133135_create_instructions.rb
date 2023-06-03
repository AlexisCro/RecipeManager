class CreateInstructions < ActiveRecord::Migration[7.0]
  def change
    create_table :instructions do |t|
      t.integer :number_of_step, null: false
      t.text :description, null: false
      t.integer :recipe_id, index: { unique: false }, foreign_key: true

      t.timestamps
    end
  end
end
