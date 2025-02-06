class Project < ApplicationRecord
  has_many :conversation_histories, dependent: :destroy

  validates :name, presence: true
  validates :status, presence: true

  STATUSES = [ "New", "In Progress", "Completed" ].freeze

  validates :status, inclusion: { in: STATUSES }
end
