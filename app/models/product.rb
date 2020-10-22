class Product < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :left_on_warehouse, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
