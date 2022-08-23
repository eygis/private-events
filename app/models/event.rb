class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"

    has_many :registrations

    has_many :attendees, through: :registrations, source: 'user'

    scope :past, -> { where('event_date < ?', Date.today) }
    scope :future, -> { where('event_date > ?', Date.today) }  
end
