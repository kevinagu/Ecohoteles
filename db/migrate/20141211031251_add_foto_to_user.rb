class AddFotoToUser < ActiveRecord::Migration
  def change
    add_column :users, :foto, :string
  end
end
