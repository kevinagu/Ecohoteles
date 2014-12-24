class Ingreso < ActiveRecord::Base
  belongs_to :producto
  belongs_to :user
  #validates :cantidad, :length =>{:minimum =>1}
end
