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

roupas = Category.create!(
  name: 'Roupas',
  parent_category: bens)

academia = Category.create!(
  name: 'Academia',
  parent_category: saude)

Promotion.create(
  title: 'Sonho de Valsa - 1kg',
  description: '<h1>Um saco de 1kg de sonho de valsa por apenas <strong><em>R$ 40.</em></strong></h1><div><br></div><h1>Faça sua reserva e venha retirar essa delícia conosco.</h1><h1><br></h1><h1><strong>Não perca essa promoção!</strong></h1>',
  banner: File.new(File.join(Rails.root,'app/assets/images/bombons.jpg')),
  valid_from: Date.new(2023, 11, 15),
  valid_to: nil,
  quantity: 5,
  price: 40,
  advertiser: loja_doces,
  category: alimentos)

Promotion.create(
  title: 'Ouro Branco - 1kg',
  description: '<h1>Um saco de 1kg de Ouro Branco por apenas <em><del>R$40</del></em><strong><em> R$ 35.</em></strong></h1><div><br></div><h1>Faça sua reserva e venha retirar essa delícia conosco!</h1><h1><br></h1><h1><strong>Não perca essa promoção. Corra antes que acabe!</strong></h1>',
  banner: File.new(File.join(Rails.root,'app/assets/images/ourobranco.jpg')),
  valid_from: Date.today,
  valid_to: nil,
  quantity: 10,
  price: 35,
  advertiser: loja_doces,
  category: alimentos)

Promotion.create(
  title: 'Cesta de Chocolates',
  description: "<h1>Deliciosa cesta de chocolates para dar de presente a um preço imperdível.</h1><div><br></div><h1>Corra, que é por poucos dias!</h1><div><br></div><h1>A cesta inclui:</h1><ul><li><h1>Snickers</h1></li><li><h1>Nutella;</h1></li><li><h1>Barra Nestlê ao Leite;</h1></li><li><h1>Marilan Teens;</h1></li><li><h1>Barra de Cholocate Hershey's;</h1></li><li><h1>M&amp;Ms;</h1></li><li><h1>KitKat;</h1></li><li><h1>E mais alguns brindes.</h1></li></ul><div><br></div><h1><strong>Aproveite, pois são poucas unidades!</strong></h1>",
  banner: File.new(File.join(Rails.root,'app/assets/images/cesta.jpg')),
  valid_from: Date.today,
  valid_to: 3.days.from_now,
  quantity: 4,
  price: 80,
  advertiser: loja_doces,
  category: alimentos)

Promotion.create(
  title: 'Cesta de Fini',
  description: "<h1><strong>Cesta fantástica numa super promoção.</strong></h1><h1><br>Uma variedade de produtos Fini mais alguns chocolates que todo mundo ama.</h1><h1><br>Não tem como errar nesse presente.</h1><div><br></div><h1>E o preço está super acessível.</h1><h1><br><strong>São poucas unidades, então corra antes que acabe!</strong></h1>",
  banner: File.new(File.join(Rails.root,'app/assets/images/cesta-fini.jpg')),
  valid_from: Date.today,
  valid_to: 5.days.from_now,
  quantity: 7,
  price: 60,
  advertiser: loja_doces,
  category: alimentos)

Promotion.create(
  title: 'Paçoquitas - 900g Grande',
  description: "h1><strong>Pote grande de Paçoquita na promoção.<br><br>Era: </strong><strong><del>R$ 34,90</del></strong><strong><br>Agora: R$ 29,90<br><br>Reserve e aproveite para vir à nossa loja conferir mais promoções como essa!</strong></h1>",
  banner: File.new(File.join(Rails.root,'app/assets/images/pacoquitas.png')),
  valid_from: Date.today,
  valid_to: nil,
  quantity: -1,
  price: 29.90,
  advertiser: loja_doces,
  category: alimentos)

Promotion.create(
  title: 'Conjunto Vermelho de Tricô',
  description: '<h1><strong>Lindo conjunto vermelho de tricô.</strong><br><br>Temos pouca unidades!</h1><div><br></div><div>Tamanhos disponíveis:</div><ul><li>P: 2;</li><li>G: 1.</li></ul><div><br></div><h1>Reserve e levaremos até sua casa!</h1>',
  banner: File.new(File.join(Rails.root,'app/assets/images/conjunto.jpg')),
  valid_from: Date.today,
  valid_to: nil,
  quantity: 3,
  price: 134.90,
  advertiser: loja_roupas,
  category: roupas)

Promotion.create(
  title: 'Conjunto Rosa para Academia',
  description: "<h1><strong>Conjunto que veste super bem e é muito confortável. Além de lindo é claro.</strong><br><br>Tercido super macio e resistente para fazer qualquer tipo de exercício sem ser incomodada.<br><br>Temos nos tamanhos do PP ao G.<br><br>Aproveite, <strong>promoção só até amanhã</strong>. Era <del>R$149,90.<br><br></del>Reserve agora, e levaremos até sua casa em até um dia útil.</h1>",
  banner: File.new(File.join(Rails.root,'app/assets/images/academia.jpg')),
  valid_from: Date.today,
  valid_to: Date.tomorrow,
  quantity: 5,
  price: 99.9,
  advertiser: loja_roupas,
  category: roupas)

Promotion.create(
  title: 'Pijama Feminino de Inverno Bege',
  description: "<h1>Pijama bem quentinho e confortável para o inverno, além de charmoso.</h1><div><br></div><h1><br>Temos apenas no tamanho M. Os outros foram vendidos bem rápido.</h1>",
  banner: File.new(File.join(Rails.root,'app/assets/images/pijama.jpg')),
  valid_from: Date.today,
  valid_to: nil,
  quantity: 1,
  price: 250,
  advertiser: loja_roupas,
  category: roupas)

Promotion.create(
  title: 'Vestido Branco + Sapato e Bolsa',
  description: '<h1><strong>Promoção Imperdível!</strong></h1><div><br>Um vestido branco + 1 par de sapatos branco + 1 bolsa = <del>R$600</del>.<del><br><br></del>Por <strong>poucos dias</strong>, e por uma quantidade <strong>limitada</strong>, você leva esse trio por <strong>apenas R$400.<br><br></strong>Temos diversos tamanhos.<br><br></div><h1><strong>Aproveite!</strong></h1><div><br></div>',
  banner: File.new(File.join(Rails.root,'app/assets/images/vestido-branco.jpg')),
  valid_from: Date.today,
  valid_to: 3.days.from_now,
  quantity: 5,
  price: 400,
  advertiser: loja_roupas,
  category: roupas)

Promotion.create(
  title: 'Macacão Verde',
  description: '<h1><strong>Lindo macacão verde para arrasar no verão!</strong></h1><div><br></div><h1>O preço está super em conta.<br><br>Temos todos os tamanhos.<br><br>Reserve agora e levaremos até sua casa em até 1 dia útil.</h1><div><br><br></div>',
  banner: File.new(File.join(Rails.root,'app/assets/images/macacao.jpg')),
  valid_from: Date.today,
  valid_to: nil,
  quantity: 10,
  price: 119.9,
  advertiser: loja_roupas,
  category: roupas)

