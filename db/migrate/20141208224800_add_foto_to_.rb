class AddFotoTo < ActiveRecord::Migration
  def change
    add_column :, :foto, :string
  end
end
