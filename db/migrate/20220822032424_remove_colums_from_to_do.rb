class RemoveColumsFromToDo < ActiveRecord::Migration[7.0]
  def change
    remove_column :to_dos, :priority, :string
    remove_column :to_dos, :category, :string
    remove_column :to_dos, :private, :boolean
  end
end
