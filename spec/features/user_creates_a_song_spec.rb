require 'rails_helper'

RSpec.feature "Creating a song" do
  scenario "creates a song and shows the user the song page" do
    song_title = "Could You Be Loved"
    artist = create(:artist)

    visit artist_path(artist.id)
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content(song_title)
    expect(page).to have_link artist.name, href: artist_path(artist.id)
  end
end
