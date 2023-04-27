class CreateCookbook < ActiveRecord::Migration[7.0]
  def change
    create_table :cookbooks do |t|
      t.string :title, default: "My cookbook", null: false
      t.integer :user_id, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
