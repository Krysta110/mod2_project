class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.datetime :date
      t.string :description
      t.integer :course_id

      t.timestamps
    end
  end
end
