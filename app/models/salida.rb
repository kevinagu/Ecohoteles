class Salida < ActiveRecord::Base
  belongs_to :producto
  belongs_to :user
  belongs_to :destino

end
