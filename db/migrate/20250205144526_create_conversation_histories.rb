class CreateConversationHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :conversation_histories do |t|
      t.references :project, null: false, foreign_key: true
      t.text :content
      t.string :type

      t.timestamps
    end
  end
end
