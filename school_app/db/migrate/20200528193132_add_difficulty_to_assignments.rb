class AddDifficultyToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :difficulty, :integer
  end
end
