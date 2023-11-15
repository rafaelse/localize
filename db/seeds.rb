# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Review.delete_all
Reservation.delete_all
Promotion.delete_all
Category.delete_all
Customer.delete_all
Advertiser.delete_all

loja_doces = Advertiser.new
loja_doces.name = 'Loja de Doces'
loja_doces.email = 'doces@localize.teste.com'
loja_doces.password = 'test123'
loja_doces.address = 'Rua Rui Barbosa, 001, Centro'
loja_doces.city = 'Jaboticabal'
loja_doces.state = 'São Paulo'
loja_doces.country = 'Brasil'
loja_doces.zip_code = '14871000'
loja_doces.save!(validate: false)

loja_roupas = Advertiser.new
loja_roupas.name = 'Loja de Roupas'
loja_roupas.email = 'roupas@localize.teste.com'
loja_roupas.password = 'test123'
loja_roupas.address = 'Av. Pintos, 001, Centro'
loja_roupas.city = 'Jaboticabal'
loja_roupas.state = 'São Paulo'
loja_roupas.country = 'Brasil'
loja_roupas.zip_code = '14871000'
loja_roupas.save!(validate: false)

#Seeding Categories
alimentos = Category.create!(
  name: 'Alimentos & Bebidas',
  parent_category: nil)

coisas = Category.create!(
  name: 'Coisas para fazer',
  parent_category: nil)

beleza = Category.create!(
  name: 'Beleza & Spas',
  parent_category: nil)

saude = Category.create!(
  name: 'Saúde & Bem-estar',
  parent_category: nil)

servicos = Category.create!(
  name: 'Serviços Locais',
  parent_category: nil)

casa = Category.create!(
  name: 'Casa & Jardim',
  parent_category: nil)

bens = Category.create!(
  name: 'Bens',
  parent_category: nil)

eletronicos = Category.create!(
  name: 'Eletrônicos',
  parent_category: bens)

restaurantes = Category.create!(
  name: 'Restaurantes',
  parent_category: alimentos)

procedimentos = Category.create!(
  name: 'Procedimentos Cosméticos',
  parent_category: beleza)

dev_pessoal = Category.create!(
  name: 'Desenvolvimento Pessoal',
  parent_category: servicos)

joalheria = Category.create!(
  name: 'Joalheria e Relógios',
  parent_category: bens)

academia = Category.create!(
  name: 'Academia',
  parent_category: saude)