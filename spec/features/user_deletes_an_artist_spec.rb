require 'rails_helper'

RSpec.feature "User can delete an artist" do
  scenario "they delete an artist from the database" do
    name  = "Bob Marley"
    image = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    Artist.create(name: name, image_path: image)

    visit artists_path

    click_on name
    click_on "Delete"

    expect(page).to have_content("All Artists")
    expect(page).not_to have_content(name)
  end
end
