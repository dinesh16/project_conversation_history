require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:conversation_histories).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:status) }
  end

  context 'when creating a project' do
    let(:project) { build(:project) }

    it 'is valid with valid attributes' do
      expect(project).to be_valid
    end

    it 'is invalid without a name' do
      project.name = nil
      expect(project).not_to be_valid
      expect(project.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a status' do
      project.status = nil
      expect(project).not_to be_valid
      expect(project.errors[:status]).to include("can't be blank")
    end
  end
end
