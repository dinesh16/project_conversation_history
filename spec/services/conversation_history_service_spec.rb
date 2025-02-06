require 'rails_helper'

RSpec.describe ConversationHistoryService, type: :service do
  let(:project) { create(:project) }
  let(:content) { "This is a conversation history" }
  let(:kind) { "comment" }

  subject { described_class.new(project: project, content: content, kind: kind) }

  describe '#call' do
    it 'creates a new conversation history record' do
      expect { subject.call }.to change { project.conversation_histories.count }.by(1)
    end

    it 'creates a conversation history with correct content and kind' do
      subject.call
      conversation_history = project.conversation_histories.last
      expect(conversation_history.content).to eq(content)
      expect(conversation_history.kind).to eq(kind)
    end
  end
end
