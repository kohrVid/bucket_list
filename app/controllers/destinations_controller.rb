class DestinationsController < ApplicationController
  def new
    @destination = Destination.new
  end
  def create
    @destination = Destination.new(destination_params)
#    respond_to do |format|
      if @destination.save
#	format.html { redirect_to bucket_list_path }
#	format.js { 
	  render partial: "destinations/destination", locals: { destination: @destination }
# }
      else
	render "bucket_lists/show"
      end
 #   end
  end


  private
    def destination_params
      params.require(:destination).permit(:name, :image_url)
    end
end
