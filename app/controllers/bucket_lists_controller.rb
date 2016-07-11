class BucketListsController < ApplicationController
  def show
#    @bucket_list = BucketList.new
    @destination = Destination.new
    @destinations = Destination.all
  end

end
