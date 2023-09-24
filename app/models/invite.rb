class Invite < ApplicationRecord
  belongs_to :invitee, class_name: "User"
  belongs_to :invitation, class_name: "Event"

  scope :invited, -> { where('invitee == ?', current_user)}
end
