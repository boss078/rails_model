def create_person(name, surname, age, date_of_birth, biography)
    person = Person.new ({
        name: name,
        surname: surname,
        age: age,
        date_of_birth: date_of_birth,
        biography: biography
    })
    begin
        person.save!
    rescue Exception => e
        puts 'Exeption happend while saving'
        puts 'Message: ' + e.message
    end
end
def create_product(title, description, price, left_on_warehouse)
    begin
        Product.create!({
            title: title,
            description: description,
            price: price,
            left_on_warehouse: left_on_warehouse
        })
    rescue Exception => e
        puts 'Exeption happend while saving'
        puts 'Message: ' + e.message
    end
end
def create_videogame(title, platform, description, release_date)
    errors = Videogame.create({
        title: title,
        platform: platform,
        description: description,
        release_date: release_date
    }).errors.full_messages
    unless errors.empty?
        puts 'Error happend while saving'
        errors.each { |e| puts 'Message: ' + e }
    end
end
def create_car(brand, model, release_date, license_plate)
    car = Car.new({
        brand: brand,
        model: model,
        release_date: release_date,
        license_plate: license_plate,
    })
    car.save
    unless car.errors.full_messages.empty?
        puts 'Error happend while saving'
        puts car.errors.full_messages.each { |msg| "Message: #{msg}"}
    end
end

def print_all_from_table(table)
    puts '~~~~~~~~~~~~~~~~~~~~~~'
    puts "#{table} table:"
    ActiveRecord::Base.connection.execute("SELECT * FROM #{table};").each do |elem|
        puts '~~~~~~~~~~~~~~~~~~~~~~'
        elem.each { |key, value| puts "#{key}: #{value} " }
    end
end
def clear_table(table)
    ActiveRecord::Base.connection.execute("DELETE FROM #{table};")
end

clear_table('people')
clear_table('products')
clear_table('videogames')
clear_table('cars')

puts 'Creating valid person and saving to the db'
create_person('John', 'Smith', 18, Time.new(2000, 10, 10), 'Sample biography')

puts 'Creating person with wrong age and trying to save to the db'
create_person('John', 'Smith', -58, Time.new(2000, 10, 10), 'Sample biography')

puts 'Creating person with wrong date of birth and trying to save to the db'
create_person('John', 'Smith', 18, Time.new(2015, 10, 10), 'Sample biography')

puts 'Creating valid product and saving to the db'
create_product('Unit1', 'This is product with description', 10, 3)

puts 'Creating valid product and saving to the db'
create_product('UnitWithoutDescription', nil, 10, 3)

puts 'Creating product with negative price and trying to save it to the db'
create_product('Unit2', 'This is product with description', -10, 3)

puts 'Creating product with negative amount on the warehouse and trying to save it to the db'
create_product('Unit3', 'This is product with description', 15, -53)

puts 'Creating valid videogame and saving to the db'
create_videogame('CoolTitle', 'PC', 'cool description', Time.new(2020, 10, 10))

puts 'Creating videogame with invalid release date and trying to save it to the db'
create_videogame('CoolTitle', 'PC', 'cool description', Time.new(2021, 10, 10))

puts 'Creating valid car and saving to the db'
create_car('Lada', 'X-Wing', Time.new(2020, 1, 1), '2323 KK-07')

puts 'Creating car without model and license plate and saving to the db'
create_car('Lada', nil, Time.new(2020, 1, 1), nil)

puts 'Creating car with invalid license plate and saving to the db'
create_car('Lada', '$-Wing', Time.new(2020, 1, 1), '$$$$ ZZ-00')

puts 'Creating car with invalid release date and saving to the db'
create_car('Lada', '$-Wing', Time.new(2030, 1, 1), '2323 ZZ-00')

print_all_from_table('people')
print_all_from_table('products')
print_all_from_table('videogames')
print_all_from_table('cars')
