class TodoItemsController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render json: TodoItem.all
      end
      format.js do
        def order_direction
          if params[:desc].present?
            params[:desc] == "true" ? "DESC" : "ASC"
          end
	end
        @todo_items = TodoItem.where("#{params[:order]} != ''").order("#{params[:order]} #{order_direction}")
      #  @todo_items = TodoItem.order("#{params[:order]} #{order_direction}")
        render :within
      end
    end
  end

  def within
    respond_to do |format|
      format.js do
        centre_point = [params[:centre][:lat], params[:centre][:lng]].map(&:to_f)
        distance = (params[:distance][:distance].to_f)/1000
        @todo_items = TodoItem.all.select do |todo_item|
          if todo_item.lat.present? && todo_item.lng.present?
            todo_item.distance_to(centre_point) <= distance
	  end
	end
	render :within
      end
    end
  end 

  private
    def todo_item_params
      params.require(:todo_item).permit(:id, :name, :likes, :image_url,
				       	:priority, :location)
    end
end
