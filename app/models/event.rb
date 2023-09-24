class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :rsvps, foreign_key: :attended_event_id
  has_many :attendees, through: :rsvps
  has_many :invites, foreign_key: :invitation_id
  has_many :invitees, through: :invites

  scope :past, -> { where('date < ?', Date.today).order(date: :desc) }
  scope :future, -> { where('date > ?', Date.today).order(:date) }
end
