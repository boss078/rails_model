def create_person(name, surname, age, date_of_birth, biography)
    person = Person.new
    person.name = name
    person.surname = surname
    person.age = age
    person.date_of_birth = date_of_birth
    person.biography = biography
    begin
        person.save!
    rescue Exception => e
        puts "Exeption happend while saving"
        puts "Message: " + e.message
    end
end
def create_product(title, description, price, left_on_warehouse)
    begin
        Product.create!(:title => title, :description => description, :price => price, :left_on_warehouse => left_on_warehouse)
    rescue Exception => e
        puts "Exeption happend while saving"
        puts "Message: " + e.message
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

puts "Creating valid person and saving to the db"
create_person("John", "Smith", 18, Time.new(2000, 10, 10), 'Sample biography')

puts "Creating person with wrong age and trying to save to the db"
create_person("John", "Smith", -58, Time.new(2000, 10, 10), 'Sample biography')

puts "Creating person with wrong date of birth and trying to save to the db"
create_person("John", "Smith", 18, Time.new(2015, 10, 10), 'Sample biography')

puts "Creating valid product and saving to the db"
create_product("Unit1", "This is product with description", 10, 3)

puts "Creating product with negative price and trying to save it to the db"
create_product("Unit2", "This is product with description", -10, 3)

puts "Creating product with negative amount on the warehouse and trying to save it to the db"
create_product("Unit3", "This is product with description", 15, -53)

print_all_from_table('people')
print_all_from_table('products')