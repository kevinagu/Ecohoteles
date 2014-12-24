class RopasController < ApplicationController
  before_action :set_ropa, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ropas = Ropa.all
    respond_with(@ropas)
  end

  def show
    respond_with(@ropa)
  end

  def new
    @ropa = Ropa.new
    respond_with(@ropa)
  end

  def edit
  end

  def create
    params[:ropa][:disponible]=0
    params[:ropa][:rotas]=0
    params[:ropa][:manchada]=0
    params[:ropa][:cantidad]=0
    @ropa = Ropa.new(ropa_params)
    @ropa.save
    respond_with(@ropa)
  end

  def update
    @ropa.update(ropa_params)
    respond_with(@ropa)
  end

  def destroy
    @ropa.destroy
    respond_with(@ropa)
  end

  private
    def set_ropa
      @ropa = Ropa.find(params[:id])
    end

    def ropa_params
      params.require(:ropa).permit(:nombre, :rotas, :manchada, :disponible, :cantidad)
    end
end
