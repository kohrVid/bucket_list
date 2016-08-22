class DestinationsController < ApplicationController

  def create
    @destinations = Destination.all
    @destination = Destination.new(destination_params)
    respond_to do |format|
      if @destination.save
	format.html { redirect_to bucket_list_path }
	format.js do
	end
	format.json do
	end
      else
	render "bucket_lists/show"
      end
    end
  end

  def update
    @destination = Destination.find(params[:id])
    @todo_items = @destination.todo_items
    @destination.update_attributes(destination_params)
    respond_to do |format|
      if @destination.save
	format.html { redirect_to bucket_list_path }
	format.js do
	end
	format.json do
	end
      else
	render "bucket_lists/show"
      end
    end
  end


  private
    def destination_params
      params.require(:destination).permit(:id, :name, :image_url,
					  todo_items_attributes: [:id,:name, :likes, 
					  :image_url, :priority, :location])
    end
end
