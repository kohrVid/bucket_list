Given(/^they have signed up$/) do
  Traveller.create!
end

Given(/^they have signed in$/) do
  next "We'll implement this later"
end

Given(/^they are on their bucketlist page$/) do
  visit bucket_list_path
end

When(/^they add a destination$/) do
  fill_in "Name", with: "India"
  fill_in "Image URL", with: "picture.jpg"
  click_button "Add Destination"
end

Then(/^the destination should appear on the bucketlist$/) do
  expect(page).to have_css("h3", text: "India")
  expect(page).to have_css('img[alt=India][src*="/images/picture.jpg"]')
end

