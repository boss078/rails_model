class DateOfBirthValidator < ActiveModel::Validator
    def validate(person)
        puts "Inside custom validate"
        if Time.now.year - person.date_of_birth.year < 18
            person.errors[:date_of_birth] << "must be 18 or more years ago"
        end
    end
end

class Person < ApplicationRecord
    validates :name, presence: true
    validates :surname, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 150 }
    validates :biography, presence: true, length: { maximum: 1000 }
    validates_with DateOfBirthValidator
    before_validation :process_before_validation
    after_validation :process_after_validation
    

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
