class CreateQuestionQueues < ActiveRecord::Migration
  def change
    create_table :question_queues do |t|
      t.string :name
      t.string :category
      t.string :day
      t.references :team, index: true

      t.timestamps
    end
  end
end
