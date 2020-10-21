class Car < ApplicationRecord
    validates :brand, presence: true, length: { maximum: 20 }
    validates :model, presence: true
    validates :release_date, presence: true
    validates_format_of :license_plate, with: /./
    before_validation :ensure_model_is_set

    private
    def ensure_model_is_set
        if model.nil?
            self.model = brand unless brand.nil?
        end
    end
end
