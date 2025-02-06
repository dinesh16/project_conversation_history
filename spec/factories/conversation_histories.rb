FactoryBot.define do
  factory :conversation_history do
    content { "This is a test comment" }
    kind { "comment" }
    project
  end
end
