class ChangeAssignmentTableDateType < ActiveRecord::Migration[6.0]
  def change
    change_column :assignments, :date, :string
  end
end
