class BucketListsController < ApplicationController
  def show
    @destination = Destination.new
    @destination.todo_items.build
    @destinations = Destination.all
    @destinations.each do |destination|
      destination.todo_items.build
    end
  end

end
