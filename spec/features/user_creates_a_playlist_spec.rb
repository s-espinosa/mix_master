require 'rails_helper'

RSpec.feature "Creating a playlist" do
  scenario "creates a playlist and shows user the playlist page" do
    song1, song2, song3 = create_list(:song, 3)
    playlist_name = "My Jams"

    visit playlists_path
    click_on "New Playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{song1.id}")
    check("song-#{song3.id}")
    click_on "Create Playlist"

    expect(page).to have_content(playlist_name)
    within("li:first") do
      expect(page).to have_link song1.title, href: song_path(song1.id)
    end
    within("li:last") do
      expect(page).to have_link song3.title, href: song_path(song3.id)
    end
  end
end
