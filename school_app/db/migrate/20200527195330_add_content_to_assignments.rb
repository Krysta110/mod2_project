class AddContentToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :content, :string
  end
end
