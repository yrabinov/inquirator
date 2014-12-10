class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.string :responses
      t.string :category
      t.integer :position
      t.belongs_to :question_queue, index:true
      t.timestamps
    end
  end
end
