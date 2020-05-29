class CreateGradeInLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :grade, :string
  end
end
