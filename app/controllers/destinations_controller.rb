class DestinationsController < ApplicationController
  def new
    @destination = Destination.new
  end
  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to bucket_list_path
    else
      render "bucket_lists/show"
    end
  end


  private
    def destination_params
      params.require(:destination).permit(:name, :image_url)
    end
end
