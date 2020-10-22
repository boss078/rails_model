class Videogame < ApplicationRecord
    validates :title, presence: true
    validates :platform, presence: true
    validates :description, length: { maximum: 300 }
    validates_date :release_date, :before => :today
end
