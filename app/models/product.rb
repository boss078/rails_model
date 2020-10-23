class Product < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :left_on_warehouse, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    private
    def ensure_model_is_set
        puts "This method happend before validation"
        description ||= title
    end
    def process_after_validation
        puts "This method happend after validation"
    end
end
