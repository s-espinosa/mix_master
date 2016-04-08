require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see a list with all artist names" do
    name1  = "Bob Marley"
    image1 = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    name2  = "Nas"
    image2 = "https://natalieisgoode.files.wordpress.com/2013/08/nas.gif"

    Artist.create(name: name1, image_path: image1)
    Artist.create(name: name2, image_path: image2)

    visit artists_path

    expect(page).to have_content name1
    expect(page).to have_content name2

    click_on "Nas"

    expect(page).to have_content name2
    expect(page).to have_css("img[src=\"#{image2}\"]")
  end
end
