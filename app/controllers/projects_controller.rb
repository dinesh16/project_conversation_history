class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :update, :leave_comment ]

  def show
    # Render project details along with its conversation history
  end

  def update
    if @project.update!(project_params)
      content = "Status changed to #{@project.status}".freeze
      add_conversation_history(content: content, kind: :status_update) if @project.saved_change_to_status?

      redirect_to @project, notice: "Project status updated."
    else
      render :show
    end
  end

  def leave_comment
    conversation_history = add_conversation_history(content: params[:content], kind: "comment")
    if conversation_history.persisted?
      redirect_to @project, notice: "Comment added to the conversation history."
    else
      render :show
    end
  end

  private

  def add_conversation_history(content:, kind:)
    ConversationHistoryService.new(project: @project, content: content, kind: kind).call
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :status)
  end
end
