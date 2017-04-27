# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create galleries
Gallery.destroy_all
Photo.destroy_all
photo_num = 1
10.times do |gallery_num|
  gallery = Gallery.create(title: "Gallery#{gallery_num}", num_photos: 0)
  rand(0..10).times do
photo = gallery.photos.create(title: "Photo#{photo_num += 1}", date_taken: Time.now)
  end
end
# gallery_num = 1
# 10.times do
# Gallery.create(title:"Gallery#{gallery_num}", num_photos: 0)