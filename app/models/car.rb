class Car < ApplicationRecord
    validates :brand, presence: true, length: { maximum: 20 }
    validates :model, presence: true
    validates :release_date, presence: true
    validates_format_of :license_plate, with: /./
    before_validation :process_before_validation
    after_validation :process_after_validation

    private
    def process_before_validation
        puts "This method happend before validation"
        if model.nil?
            self.model = brand unless brand.nil?
        end
    end
    def process_after_validation
        puts "This method happend after validation"
    end
end
