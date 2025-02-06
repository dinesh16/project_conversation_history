require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) { create(:project) }

  describe "GET #show" do
    it "renders the show template" do
      get :show, params: { id: project.id }
      expect(response.status).to eq(200)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:valid_params) { { id: project.id, project: { status: "completed" } } }

      it "updates the project and adds conversation history if status changes" do
        allow_any_instance_of(ConversationHistoryService).to receive(:call).and_return(double(persisted?: true))
        patch :update, params: valid_params
        project.reload
        expect(project.status).to eq("completed")
        expect(response).to redirect_to(project)
        expect(flash[:notice]).to eq("Project status updated.")
      end
    end
  end

  describe "POST #leave_comment" do
    let(:valid_params) { { id: project.id, content: "This is a comment." } }

    it "adds a comment to the conversation history" do
      allow_any_instance_of(ConversationHistoryService).to receive(:call).and_return(double(persisted?: true))
      post :leave_comment, params: valid_params
      expect(response).to redirect_to(project)
      expect(flash[:notice]).to eq("Comment added to the conversation history.")
    end
  end
end
