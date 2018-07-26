class WineriesController < ApplicationController

  before_action :set_winery, only: [:show, :edit, :update, :destroy]

  def index
    search = params[:term].present? ? params[:term] :nil
    @wineries = if search
      Winery.search(search)
    else
      Winery.all
    end
    @markers = @wineries.map do |winery|
       {
        lat: winery.latitude,
        lng: winery.longitude
      }
    end
  #         {
  #           lat: winery.latitude,
  #           lng: winery.longitude,
  #           # nooooo -  infoWindow: { content: render_to_string(partial: "/winery/map_box", locals: { winery: winery }) }
  #         }
  #       end

  # def index
  #   # @wineries = Winery.all --- noooooo
  #   if @wineries = Winery.where.not(latitude: nil, longitude: nil)

  #       @markers = @wineries.map do |winery|
  #         {
  #           lat: winery.latitude,
  #           lng: winery.longitude,
  #           # nooooo -  infoWindow: { content: render_to_string(partial: "/winery/map_box", locals: { winery: winery }) }
  #         }
  #       end
  #   else
  #     @wineries = Winery.all
  #   end
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

  def autocomplete
    render json: Winery.search(params[:query], {
      fields: ["name^5", "address"],
      match: :word_start,
      limit: 10,
      misspellings: {below: 5}
    }).map(&:name)
  end

  private

  def winery_params
    params.require(:winery).permit(:name, :tours, :address, :photo)
  end

  def set_winery
    @winery = Winery.find(params[:id])
  end
end
