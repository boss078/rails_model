class Product < ApplicationRecord
    validates :title, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :left_on_warehouse, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    before_validation :process_before_validation
    after_validation :process_after_validation

    private
    def process_before_validation
        puts 'This method happend before validation'
        self.description ||= title
        self.price ||= 5.0
        self.left_on_warehouse ||= 0
    end
    def process_after_validation
        puts 'This method happend after validation'
    end
end
