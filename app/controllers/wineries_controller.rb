class WineriesController < ApplicationController

  before_action :set_winery, only: [:show, :edit, :update, :destroy]

  def index
    @wineries = Winery.all
  end
  def show
  end
  def new
    @winery = Winery.new
  end

  def create
    Winery.create(winery_params)
    redirect_to wineries_path
  end

  def edit
  end

  def update
    @winery.update(winery_params)
    redirect_to winery_path(@winery)
  end

  def destroy
    @winery.destroy
    redirect_to wineries_path
  end

  private

  def winery_params
    params.require(:winery).permit(:name, :tours)
  end

  def set_winery
    @winery = Winery.find(params[:id])
  end
end
