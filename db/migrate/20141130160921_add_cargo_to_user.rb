class AddCargoToUser < ActiveRecord::Migration
  def change
    add_reference :users, :cargo, index: true
  end
end
