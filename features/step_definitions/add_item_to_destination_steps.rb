Given(/^have added a destination$/) do
  step "they add a destination"
  #@destination = Destination.last
  @destination = Destination.create!(name: "India", image_url: "picture.jpg")
  todo_item = @destination.todo_items.build(name: Faker::Lorem.sentence, location: Faker::Address.city)
  Geocoder::Lookup::Test.add_stub(
    todo_item.geocoder_input, [
      {
	'latitude'     => 51.76000699999999,
	'longitude'    => -0.015042,
	'address'      => Faker::Address.street_address,
	'state'        => 'Tamil Nadu',
	'state_code'   => 'GO',
	'city'	    =>  todo_item.location,
	'country'      => 'India',
	'country_code' => 'IN'
      }
    ]
  )
  todo_item.save!
  visit bucket_list_path
end

When(/^they add  todo item$/) do
  within ("#edit_destination_#{@destination.id}") do
    first("#name-#{@destination.id}").set("Ride an elephant")
    first("#likes-#{@destination.id}").set("1")
    first("#image_url-#{@destination.id}").set("elephant.jpg")
    first("#priority-#{@destination.id}").set("1")
    first("#location-#{@destination.id}").set("New Delhi")
    first("#item-submit-#{@destination.id}").click
  end
end

When(/^they order the todo items by title$/) do
  click_link "Order by title"
end

Then(/^the list should be orderd by alpha$/) do
  todo_items = all("#show-todo-items li").map(&:text)
  expect(todo_items).to eq(todo_item.order("name DESC"))
end


Then(/^the todo item should appear alongside the destination on the BucketList page$/) do
  expect(page).to have_css("h4", text: "Ride an elephant")
  expect(page).to have_css("p", text: "Priority: 1")
  expect(page).to have_css("p", text: "Location: New Delhi")
  expect(page).to have_css("p", text: "Latitude: 28.6139391")
  expect(page).to have_css("p", text: "Longitude: 77.2090212")
#  expect(page).to have_css('img[alt="New Delhi"][src*="/images/elephant.jpg"]')
end


