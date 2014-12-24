class EntregasController < ApplicationController
  before_action :set_entrega, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @entregas = Entrega.all
    respond_with(@entregas)
  end

  def show
    respond_with(@entrega)
  end

  def new
    @entrega = Entrega.new
    respond_with(@entrega)
  end

  def edit
  end

  def create
    params[:entrega][:user_id]=current_user.id
    @entrega = Entrega.new(entrega_params)
    @ropa = Ropa.find(params[:entrega][:ropa_id])
    proc=params[:entrega][:destino_id]
    if proc=="1"
      @ropa.cantidad= @ropa.cantidad-params[:entrega][:cantidad].to_i
      @ropa.rotas = @ropa.rotas - params[:entrega][:rotas].to_i
      @ropa.manchada = @ropa.manchada - params[:entrega][:manchada].to_i
    else

      @ropa.rotas = @ropa.rotas - params[:entrega][:rotas].to_i
      @ropa.manchada = @ropa.manchada - params[:entrega][:manchada].to_i
      @ropa.disponible =@ropa.disponible-params[:entrega][:cantidad].to_i
    end
    @ropa.save
    @entrega.save
    respond_with(@entrega)
  end

  def update
    @entrega.update(entrega_params)
    respond_with(@entrega)
  end

  def destroy
    idr=@entrega.ropa_id
    @ropa=Ropa.find(idr)
    if @entrega.destino_id==1
      @ropa.cantidad= @ropa.cantidad+@entrega.cantidad
      @ropa.rotas = @ropa.rotas + @entrega.rotas
      @ropa.manchada = @ropa.manchada + @entrega.manchada
    else
      @ropa.rotas = @ropa.rotas + @entrega.rotas
      @ropa.manchada = @ropa.manchada + @entrega.manchada
      @ropa.disponible =@ropa.disponible+@entrega.cantidad
    end
    @ropa.save
    @entrega.destroy
    respond_with(@entrega)
  end

  private
    def set_entrega
      @entrega = Entrega.find(params[:id])
    end

    def entrega_params
      params.require(:entrega).permit(:ropa_id, :cantidad, :rotas, :manchada, :destino, :user_id)
    end
end
