class AmongUsPlayer < ApplicationRecord
    validates :nickname, presence: true
    validates :is_imposter, presence: true
    validates :completed_tasks, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    before_validation :process_before_validation
    after_validation :process_after_validation

    private
    def process_before_validation
        puts "This method happend before validation"
    end
    def process_after_validation
        puts "This method happend after validation"
    end
end
