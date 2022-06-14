class Event < ApplicationRecord
    has_many :event_lists
    has_many :attendees, through: :event_lists, source: :user

    belongs_to :creator, class_name: "User"

    scope :past, ->  {where("STRFTIME('%Y-%m-%d', eventDate) < ?", Time.current)}

    scope :upcoming, -> {where("STRFTIME('%Y-%m-%d', eventDate) >= ?", Time.current)}


end
