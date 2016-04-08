require 'rails_helper'

RSpec.feature "User edits an existing artist" do
  scenario "they successfully edit an artist page" do
    name  = "Bob Marley"
    image = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: name, image_path: image)

    visit artist_path(artist.id)

    click_on "Edit"

    new_name = "The Bob"
    fill_in "artist_name", with: new_name

    click_on "Update Artist"

    expect(page).to have_content new_name

    expect(page).to have_css("img[src=\"#{image}\"]")
  end
end
