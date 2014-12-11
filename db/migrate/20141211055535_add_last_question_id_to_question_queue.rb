class AddLastQuestionIdToQuestionQueue < ActiveRecord::Migration
  def change
    add_column :question_queues, :last_question_id, :integer
  end
end
