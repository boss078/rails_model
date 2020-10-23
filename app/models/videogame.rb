class Videogame < ApplicationRecord
    validates :title, presence: true
    validates :platform, presence: true
    validates :description, length: { maximum: 300 }
    validates :release_date, presence: true
end
