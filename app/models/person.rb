class Person < ApplicationRecord
    validates :name, presence: true
    validates :surname, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 150 }
    validates :date_of_birth, presence: true
    validates :biography, presence: true, length: { maximum: 1000 }
end
