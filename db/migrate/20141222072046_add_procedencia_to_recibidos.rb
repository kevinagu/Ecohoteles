class AddProcedenciaToRecibidos < ActiveRecord::Migration
  def change
    add_reference :recibidos, :procedencia, index: true
  end
end
