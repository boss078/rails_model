class Film < ApplicationRecord
    validates :title, presence: true
    validates :age_limit, presence: true, numericality: { only_integer: true, greater_than_or_equal: 0 }
    validates :length, presence: true
    validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal: 0, less_than_or_equal_to: 100 }
    before_validation :process_before_validation
    after_validation :process_after_validation

    private
    def process_before_validation
        puts "This method happend before validation"
        rating ||= 50
    end
    def process_after_validation
        puts "This method happend after validation"
    end
end
