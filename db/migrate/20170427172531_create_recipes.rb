class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.integer :serves
      t.text :ingredients
      t.integer :rating

      t.timestamps
    end
  end
end
