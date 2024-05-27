class AddToDotoUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :to_dos, :user, foreign_key: true
  end
end
