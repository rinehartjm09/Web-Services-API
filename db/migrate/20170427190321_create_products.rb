class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :price
      t.integer :quantity
      t.binary :image

      t.timestamps
    end
  end
end
