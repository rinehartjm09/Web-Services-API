class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.datetime :date_taken
      t.string :url
      t.references :gallery, foreign_key: true

      t.timestamps
    end
  end
end
