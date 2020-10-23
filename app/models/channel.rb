class Channel < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 30}
    validates :streaming_platform, presence: true
    validates :subscribers, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    before_validation :process_before_validation
    after_validation :process_after_validation

    private
    def process_before_validation
        puts "This method happend before validation"
        streaming_platform ||= "Twetch"
    end
    def process_after_validation
        puts "This method happend after validation"
    end
end
