require '_custom_validators'

class Car < ApplicationRecord
    include CustomValidators

    validates :brand, presence: true, length: { maximum: 20 }
    validates :release_date, presence: true
    validates_with ReleaseDateValidator
    validates_format_of :license_plate, with: /\d{4}+\s+\w{2}+-+\d{2}/
    before_validation :process_before_validation
    after_validation :process_after_validation

    private
    def process_before_validation
        puts 'This method happend before validation'
        self.model ||= brand unless brand.nil?
        self.license_plate ||= '1111 AA-01'
    end
    def process_after_validation
        puts 'This method happend after validation'
    end
end
