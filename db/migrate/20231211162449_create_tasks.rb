class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :status
      t.string :priority
      t.date :deadline
      t.references :project, null: false, foreign_key: true
      t.references :project_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
