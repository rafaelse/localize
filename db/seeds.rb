# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reservation.delete_all
Promotion.delete_all
Category.delete_all
Customer.delete_all
Advertiser.delete_all

advertiser = Advertiser.new
advertiser.name = 'Comerciante'
advertiser.email = 'rfs.rafael23@gmail.com'
advertiser.password = 'abcd1234'
advertiser.save!(validate: false)

#Seeding Categories
Category.create!(
  id: 1,
  name: 'Food & Drink',
  parent_category: nil)

Category.create!(
  id: 2,
  name: 'Things to Do',
  parent_category: nil)
  
Category.create!(
  id: 3,
  name: 'Beauty & Spas',
  parent_category: nil)
  
Category.create!(
  id: 4,
  name: 'Health & Fitness',
  parent_category: nil)
  
Category.create!(
  id: 5,
  name: 'Local Services',
  parent_category: nil)
  
Category.create!(
  id: 6,
  name: 'Electronics',
  parent_category: nil)
  
Category.create!(
  id: 7,
  name: 'Women',
  parent_category: nil)
  
Category.create!(
  id: 8,
  name: 'Home & Garden',
  parent_category: nil)
  
Category.create!(
  id: 9,
  name: 'Goods',
  parent_category: nil)
  
Category.create!(
  id: 10,
  name: 'Gateways',
  parent_category: nil)
  
Category.create!(
  id: 11,
  name: 'Restaurants',
  parent_category: Category.find(1))
  
Category.create!(
  id: 12,
  name: 'Cosmetic Procedures',
  parent_category: Category.find(3))

Category.create!(
  id: 13,
  name: 'Personal Development',
  parent_category: Category.find(5))

Category.create!(
  id: 14,
  name: 'Lingerie',
  parent_category: Category.find(7))

Category.create!(
  id: 15,
  name: 'Jewelry & Watches',
  parent_category: Category.find(9))
  
# Seeding Promotions
Promotion.new(
  id: 1,
  title: 'Model Airplane 500 RTF',
  description: 'A very nice trainer airplane to learn how to fly.',
  banner: File.new(File.join(Rails.root,'app/assets/images/airplane.jpg')),
  valid_from: Date.new(2015, 02, 01),
  valid_to: nil,
  quantity: 5,
  price: 300,
  advertiser: advertiser,
  category: Category.find(9)).save(validate: false)
  
Promotion.new(
  id: 2,
  title: 'Model Airplane Flying Lessons',
  description: 'Model airplane flying lessons 3 times a week with a experienced instructor.',
  banner: File.new(File.join(Rails.root,'app/assets/images/flylessons.jpg')),
  valid_from: Date.new(2015, 02, 01),
  valid_to: nil,
  quantity: 25,
  price: 200,
  advertiser: advertiser,
  category: Category.find(5)).save(validate: false)
  
Promotion.new(
  id: 3,
  title: 'Custom Cars Exhibition',
  description: 'Come see the coolest custom cars of Canada. You will be amazed!',
  banner: File.new(File.join(Rails.root,'app/assets/images/cars.jpg')),
  valid_from: Date.new(2015, 06, 01),
  valid_to: Date.new(2015, 07, 31),
  quantity: 2000,
  price: 50,
  advertiser: advertiser,
  category: Category.find(2)).save(validate: false)
  
Promotion.new(title: 'Technology Fair',
  id: 4,
  description: 'Come check out all new releases in the world of technology.',
  banner: File.new(File.join(Rails.root,'app/assets/images/techfair.jpg')),
  valid_from: Date.new(2015, 8, 01),
  valid_to: Date.new(2015, 9, 20),
  quantity: 2000,
  price: 30,
              advertiser: advertiser,
  category: Category.find(2)).save(validate: false)
  
Promotion.new(
  id: 5,
  title: 'Complete Hair, Skin & Nails Care',
  description: 'Spend a day in our beauty salon taking care of you as you never did before.',
  banner: File.new(File.join(Rails.root,'app/assets/images/beautycare.jpg')),
  valid_from: Date.new(2015, 01, 01),
  valid_to: nil,
  quantity: -1,
  price: 150,
  advertiser: advertiser,
  category: Category.find(3)).save(validate: false)
  
Promotion.new(
  id: 6,
  title: 'Complete Body Massage',
  description: 'Relax all the tension in your body with our massage experts.',
  banner: File.new(File.join(Rails.root,'app/assets/images/massage.jpg')),
  valid_from: Date.new(2015, 01, 01),
  valid_to: nil,
  quantity: -1,
  price: 100,
  advertiser: advertiser,
  category: Category.find(4)).save(validate: false)
  
Promotion.new(
  id: 7,
  title: 'Advanced Math Lessons',
  description: 'Master all advanced math concepts of Calculus, Linear Algebra and Analytic Geometry. Classes 3 times a week.',
  banner: File.new(File.join(Rails.root,'app/assets/images/math.jpg')),
  valid_from: Date.new(2015, 04, 01),
  valid_to: nil,
  quantity: 30,
  price: 200,
  advertiser: advertiser,
  category: Category.find(5)).save(validate: false)
  
Promotion.new(
  id: 8,
  title: 'Basic Eletronics Course',
  description: 'Learn how to fix your eletronic goods and how to build new simple gadgets.',
  banner: File.new(File.join(Rails.root,'app/assets/images/electronics.jpg')),
  valid_from: Date.new(2015, 04, 01),
  valid_to: nil,
  quantity: 30,
  price: 300,
  advertiser: advertiser,
  category: Category.find(5)).save(validate: false)
  
Promotion.new(
  id: 9,
  title: '4k Thin TV Set',
  description: 'Awesome resolution TV set in a special offer only from our local store.',
  banner: File.new(File.join(Rails.root,'app/assets/images/tv.png')),
  valid_from: Date.new(2015, 8, 01),
  valid_to: nil,
  quantity: 10,
  price: 900,
  advertiser: advertiser,
  category: Category.find(6)).save(validate: false)

Promotion.new(
  id: 10,
  title: 'Automated Grass Cutter',
  description: 'This automated grass cutter will clean your yard all by itself.',
  banner: File.new(File.join(Rails.root,'app/assets/images/grasscut.jpg')),
  valid_from: Date.new(2015, 07, 01),
  valid_to: nil,
  quantity: 5,
  price: 2000,
  advertiser: advertiser,
  category: Category.find(8)).save(validate: false)
