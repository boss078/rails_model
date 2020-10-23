class Person < ApplicationRecord
    validates :name, presence: true
    validates :surname, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 150 }
    validates :date_of_birth, presence: true
    validates :biography, presence: true, length: { maximum: 1000 }

    private
    def process_before_validation
        puts "This method happend before validation"
        name ||= "John"
        surname ||= "Smith"
    end
    def process_after_validation
        puts "This method happend after validation"
    end
end
