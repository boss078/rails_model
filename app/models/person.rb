

class Person < ApplicationRecord
    validates :name, presence: true
    validates :surname, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 150 }
    validates :biography, presence: true, length: { maximum: 1000 }
    validate :must_be_18_years_old
    before_validation :process_before_validation
    after_validation :process_after_validation
    

    private
    def must_be_18_years_old
        if Time.now.year - date_of_birth.year < 18
            errors[:date_of_birth] << 'must be 18 or more years ago'
        end
        if age < 18
            errors[:age] << 'must be at least 18'
        end
    end
    def process_before_validation
        self.name ||= 'John'
        self.surname ||= 'Smith'
    end
    def process_after_validation
        puts 'This method happend after validation'
    end
end
