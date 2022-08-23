class Registration < ApplicationRecord
    belongs_to :event, optional: true
    belongs_to :user, optional: true

    validates :user_id, uniqueness: {scope: :event_id, message: "User already registered for this event!"}, presence: true
    validates :event_id, presence: true
end
