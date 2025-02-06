class ConversationHistoryService
  def initialize(project:, content:, kind:)
    @project = project
    @content = content
    @kind = kind
  end

  def call
    @project.conversation_histories.create!(content: @content, kind: @kind)
  end
end
