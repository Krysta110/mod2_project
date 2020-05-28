class ChangeAssignmentTable < ActiveRecord::Migration[6.0]
  def change
    change_column :assignments, :date, :date
  end
end
