class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :title
      t.string :email
      t.references :team, index: true

      t.timestamps
    end
  end
end
