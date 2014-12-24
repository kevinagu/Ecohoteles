class RemoveProcedenciaFromRecibidos < ActiveRecord::Migration
  def change
    remove_column :recibidos, :procedencia, :string
  end
end
