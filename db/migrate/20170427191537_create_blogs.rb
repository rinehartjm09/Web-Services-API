class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :author
      t.date :published_date

      t.timestamps
    end
  end
end
