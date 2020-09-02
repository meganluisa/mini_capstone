# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   rails generate model Product title:string artist:string price:integer image_url:string description:string

# product = Product.new({ title: "The Starry Night", artist: "Vincent van Gogh", price: 1050000, image_url: "https://www.vangoghstudio.com//Files/6/102000/102147/ProductPhotos/Source/307257209.jpg", description: "Oil on Canvas. Created in 1889. This artwork is located at MoMA in New York, USA." })
product = Product.new({ title: "Kumgang Mountains", artist: "Chong Son", price: 1000000, image_url: "https://i.pinimg.com/originals/06/61/6f/06616fa2e34e85428458dd6b00214d97.jpg", description: "Hanging scroll, ink and colors on paper. Created in 1734. Located at Hoam Art Museum,Kyunggi-Do." })
product.save
