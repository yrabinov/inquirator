class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.references :question, index: true
      t.references :team_member, index: true
      t.string :response_choice
      t.text :extended_response
      t.string :response_token

      t.timestamps
    end
  end
end
