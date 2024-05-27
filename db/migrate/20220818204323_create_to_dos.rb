class CreateToDos < ActiveRecord::Migration[7.0]
  def change
    create_table :to_dos do |t|
      t.string :name
      t.string :remarks
      t.datetime :date_to_be_completed
      t.boolean :private

      t.timestamps
    end
  end
end
