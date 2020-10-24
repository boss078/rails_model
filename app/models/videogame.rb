require '_custom_validators'

class Videogame < ApplicationRecord
    include CustomValidators

    validates :title, presence: true
    validates :platform, presence: true
    validates :description, length: { maximum: 300 }
    validates :release_date, presence: true
    validates_with ReleaseDateValidator
    before_validation :process_before_validation
    after_validation :process_after_validation

    private
    def process_before_validation
        puts 'This method happend before validation'
        self.platform ||= 'PC'
        self.description ||= title
    end
    def process_after_validation
        puts 'This method happend after validation'
    end
end
