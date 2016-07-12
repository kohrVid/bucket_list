Given(/^have added a destination$/) do
  step "they add a destination"
  #@destination = Destination.last
  @destination = Destination.create!(name: "India", image_url: "picture.jpg")
  visit bucket_list_path
end

When(/^they add a todo item$/) do
  save_and_open_page
  within ("#edit_destination_#{@destination.id}") do
    first("#name-#{@destination.id}").set("Ride an elephant")
    first("#likes-#{@destination.id}").set("1")
    first("#image_url-#{@destination.id}").set("elephant.jpg")
    first("#priority-#{@destination.id}").set("1")
    first("#where-#{@destination.id}").set("New Delhi")
    first("#latitude-#{@destination.id}").set("28.6139°")
    first("#longitude-#{@destination.id}").set("77.2090°")
    first("#item-submit-#{@destination.id}").click
  end
end

Then(/^the todo item should appear alongside the destination on the BucketList page$/) do
  expect(page).to have_css("h4", text: "Ride an elephant")
  expect(page).to have_css("p", text: "Priority: 1")
  expect(page).to have_css("p", text: "Where: New Delhi")
  expect(page).to have_css("p", text: "Latitude: 28.6139°")
  expect(page).to have_css("p", text: "Longitude: 77.2090°")
#  expect(page).to have_css('img[alt="New Delhi"][src*="/images/elephant.jpg"]')
end


