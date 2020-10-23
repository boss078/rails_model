class ReleaseDateValidator < ActiveModel::Validator 
    def validate(videogame)
        if videogame.release_date > Time.now
            videogame.errors[:release_date] << "can't be > than now"
    end
end
class Videogame < ApplicationRecord
    validates :title, presence: true
    validates :platform, presence: true
    validates :description, length: { maximum: 300 }
    validates :release_date, presence: true
    before_validation :process_before_validation
    after_validation :process_after_validation

    private
    def process_before_validation
        puts "This method happend before validation"
        platform ||= "PC"
    end
    def process_after_validation
        puts "This method happend after validation"
    end
end
