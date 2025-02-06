class ConversationHistory < ApplicationRecord
  belongs_to :project

  validates :content, presence: true
  validates :kind, presence: true

  default_scope { order(created_at: :desc) }
end
