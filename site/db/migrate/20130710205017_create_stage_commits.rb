class CreateStageCommits < ActiveRecord::Migration
  def change
    create_table :stage_commits do |t|
      t.string :project
      t.string :sha
      t.string :developer
      t.string :email
      t.string :commit_stamp
      t.boolean :approved
      t.string :approver
      t.text :comment

      t.timestamps
    end
  end
end
