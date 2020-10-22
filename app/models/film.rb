class Film < ApplicationRecord
    validates :title, presence: true
    validates :age_limit, presence: true, numericality: { only_integer: true, greater_than_or_equal: 0 }
    validates :length, presence: true
    validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal: 0, less_than_or_equal_to: 100 }
end