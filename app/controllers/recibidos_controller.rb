class RecibidosController < ApplicationController
  before_action :set_recibido, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @recibidos = Recibido.all
    respond_with(@recibidos)
  end

  def show
    respond_with(@recibido)
  end

  def new
    @recibido = Recibido.new
    respond_with(@recibido)
  end

  def edit
  end

  def create
    params[:recibido][:user_id]=current_user.id
    @recibido = Recibido.new(recibido_params)
    @ropa = Ropa.find(params[:recibido][:ropa_id])
    proc=params[:recibido][:procedencia_id]
    if proc=="1"
      @ropa.disponible =@ropa.disponible+params[:recibido][:cantidad].to_i
      @ropa.cantidad =@ropa.cantidad+params[:recibido][:cantidad].to_i
      @recibido.rotas=0
      @recibido.manchada=0
    else
      @ropa.rotas = @ropa.rotas + params[:recibido][:rotas].to_i+0
      @ropa.manchada =@ropa.manchada + params[:recibido][:manchada].to_i+0
      @ropa.disponible =@ropa.disponible+params[:recibido][:cantidad].to_i-@ropa.rotas-@ropa.manchada 
    end
    @ropa.save
    @recibido.save
    respond_with(@recibido)
  end

  def update
    @recibido.update(recibido_params)
    respond_with(@recibido)
  end

  def destroy
    idr=@recibido.ropa_id
    @ropa=Ropa.find(idr)
    if @recibido.procedencia_id==1
      @ropa.disponible =@ropa.disponible-@recibido.cantidad
      @ropa.cantidad =@ropa.cantidad-@recibido.cantidad
    else
      @ropa.rotas = @ropa.rotas-@recibido.rotas
      @ropa.manchada = @ropa.manchada-@recibido.manchada
      @ropa.disponible =@ropa.disponible-@recibido.cantidad
    end
    @ropa.save
    @recibido.destroy
    respond_with(@recibido)
  end

  private
    def set_recibido
      @recibido = Recibido.find(params[:id])
    end

    def recibido_params
      params.require(:recibido).permit(:ropa_id, :cantidad, :rotas, :manchada, :procedencia_id, :user_id)
    end
end
