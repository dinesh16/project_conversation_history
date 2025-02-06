require 'rails_helper'

RSpec.describe ConversationHistory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:kind) }
  end

  context 'when creating a conversation_history' do
    let(:conversation_history) { create(:conversation_history) }

    it 'is valid with valid attributes' do
      expect(conversation_history).to be_valid
    end

    it 'is invalid without a content' do
      conversation_history.content = nil
      expect(conversation_history).not_to be_valid
      expect(conversation_history.errors[:content]).to include("can't be blank")
    end

    it 'is invalid without a kind' do
      conversation_history.kind = nil
      expect(conversation_history).not_to be_valid
      expect(conversation_history.errors[:kind]).to include("can't be blank")
    end
  end
end
