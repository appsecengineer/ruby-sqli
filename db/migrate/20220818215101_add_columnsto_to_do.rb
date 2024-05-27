class AddColumnstoToDo < ActiveRecord::Migration[7.0]
  def change
    add_column :to_dos, :priority, :string
    add_column :to_dos, :category, :string
  end
end
