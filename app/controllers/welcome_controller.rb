class WelcomeController < ApplicationController
  respond_to :html
  def index
  	@ag=Producto.where('cantidad < stock')

  
  	respond_with(@ag)
  end
end
