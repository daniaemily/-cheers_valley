class WineriesController < ApplicationController

  before_action :set_winery, only: [:show, :edit, :update, :destroy]

  def index
    # @wineries = Winery.all
    if @wineries = Winery.where.not(latitude: nil, longitude: nil)

      @markers = @wineries.map do |winery|
        {
          lat: winery.latitude,
          lng: winery.longitude
        }
      end
    else
      @wineries = Winery.all
    end
  end

  def show
    @winery_coordinates = { lat: @winery.latitude, lng: @winery.longitude }
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
    params.require(:winery).permit(:name, :tours, :address)
  end

  def set_winery
    @winery = Winery.find(params[:id])
  end
end
