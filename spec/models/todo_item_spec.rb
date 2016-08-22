require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  let(:destination) { Destination.create!(name: "United Kingdom", image_url: "picture.jpg")}
  let(:todo_item) { TodoItem.create!(name: "Learn Coding", image_url: "picture.jpg", location: "Hoddesdon", destination: destination)}

  describe "geocoding" do
    it "provides a string for geocoder input" do
      expect(todo_item.geocoder_input).to eq("Hoddesdon, United Kingdom")
    end

    it "automatically geocodes the model on save" do
#=begin
      expect(todo_item.lat).to eq(51.76000699999999.to_d)
      expect(todo_item.lng).to eq(-0.015042.to_d)
#=end
=begin
      expect(todo_item.lat).to be_within(0.000001).of(51.76000699999999)
      expect(todo_item.lng).to  be_within(0.000001).of(-0.015042)
=end
    end
  end  
end
