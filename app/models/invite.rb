class Invite < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :due_date, presence: true
end
