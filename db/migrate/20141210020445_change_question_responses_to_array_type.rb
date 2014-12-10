class ChangeQuestionResponsesToArrayType < ActiveRecord::Migration
  def change
    remove_column :questions, :responses
    add_column :questions, :responses, :string, array:true, default:[]
  end
end
