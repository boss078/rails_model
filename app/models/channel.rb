class Channel < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 30}
    validates :streaming_platform, presence: true
    validates :subscribers, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
