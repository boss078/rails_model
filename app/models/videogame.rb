class Videogame < ApplicationRecord
    validates :title, presence: true
    validates :platform, presence: true
    validates :description, length: { maximum: 300 }
    validates :release_date, presence: true

    private
    def ensure_model_is_set
        puts "This method happend before validation"
        platform ||= "PC"
    end
    def process_after_validation
        puts "This method happend after validation"
    end
end
