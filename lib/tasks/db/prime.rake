namespace :db do
  task :prime => :environment do
    puts "Creating kinds"
    create_product_kinds { print '.' }
    puts "Creating products"
    create_products { print '.' }
    puts "Creating customers"
    create_customers { print '.' }
    puts "Creating random orders"
    create_random_orders { print '.' }
  end

  def create_product_kinds
    ['Light Roast Coffee', 'Medium Roast Coffee', 'Dark Roast Coffee'].each do |name|
      ProductKind.create! name: name
      yield if block_given?
    end
    puts '' if block_given?
  end

  def create_products
    [
      ['OP-DRC-C1', 'Brazil Verde, Italian Roast', 'Soft, nutty, low acid, with nice bitter-sweet chocolate tastes.', 3, '80', 1500, 3200],
      ['OP-MRC-C2', 'Jamaica Blue Mountain, Vienna Roast', 'Rich flavor, rich aroma, moderate acidity, and an even balance.', 2, '0', 20000, 42000],
      ['OP-LRC-C3', 'Colombian Supremo, Cinnamon Roast', 'Full bodied with a light acidity making a balanced cup.', 1, '150', 2000, 4200],
      ['OP-LRC-C4', 'Guatemala Antigua, New England Roast', 'Lively acidity, complex spiciness, and chocolate laced aftertaste.', 1, '0', 1300, 2900],
      ['OP-MRC-C5', 'Ethiopian Moka Java, Breakfast Roast', 'Possess an intense floral bouquet and create a pleasant cup of coffee.', 2, '130', 1800, 3900],
      ['OP-DRC-C6', 'European Royale, French Roast', 'Begins full, mellows as it lingers and then finishes with a smooth sweet aftertaste.', 3, '70', 1200, 2500],
      ['OP-MRC-C7', 'Hawaiian Kona, Medium Roast', 'A rich, rounded cup with superb fragrance and flavor of Kona.', 2, '60', 2100, 3200],
      ['OP-LRC-C8', 'Papua New Guinea Arokara, Light City Roast', 'Sweet aroma, round body, lively acidity.', 1, '90', 1400, 2900],
      ['OP-DRC-C9', 'Bali Blue Moon, French Roast', 'A classic clean cup with great body and mildness.', 3, '70', 1200, 2200]
    ].each do |data|
      sku, name, description, type_id, stock, cost, selling_price = data
      Product.create!(
        sku: sku,
        name: name,
        description: description,
        product_kind: ProductKind.find(type_id),
        stock: stock,
        cost: cost,
        selling_price: selling_price
      )
      yield if block_given?
    end
    puts '' if block_given?
  end

  def create_customers
    [
      ['Barbara Rogers', 'Skyba', 'brogers0@t-online.de', '81 Sutteridge Lane', '1234', 'Cikiruh Wetan', 'Indonesia'],
      ['Paula Hill', 'Demivee', 'phill1@dailymail.co.uk', '66 Lillian Parkway', '1234', 'Guodu', 'China'],
      ['Andrea Wells', 'Quinu', 'awells2@noaa.gov', '790 East Plaza', '1234', 'Punolu', 'Philippines'],
      ['Jonathan Hanson', 'Katz', 'jhanson3@wiley.com', '6 Corben Crossing', '1234', 'Tongshanxiang', 'China'],
      ['Stephanie Baker', 'Twitterwire', 'sbaker4@google.ca', '1938 Pine View Street', '1234', 'Bijia', 'China']
    ].each do |data|
      full_name, company_name, email, address, postal_code, city, country = data
      Customer.create!(
        full_name: full_name,
        company_name: company_name,
        email: email,
        address: address,
        postal_code: postal_code,
        city: city,
        country: country
      )
      yield if block_given?
    end
    puts '' if block_given?
  end

  def create_random_orders(count = 60)
    Array.new(count).map do
      order = Order.create! customer: Customer.order('RANDOM()').first
      rand(8).times do
        OrderLine.create! order: order, product: Product.order('RANDOM()').first, amount: rand(3) + 1
      end
      yield if block_given?
    end
    puts '' if block_given?
  end
end
