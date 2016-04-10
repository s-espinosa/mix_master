require 'rails_helper'

RSpec.feature "User edits and existing playlist" do
  scenario "successfully edit a playlist" do
  playlist = create(:playlist_with_songs)
  song1, song2, song3 = playlist.songs
  song4               = create(:song, title: "Song 4")

  visit playlist_path(playlist.id)
  click_on "Edit"
  new_name = "New Name"
  fill_in "playlist_name", with: new_name
  uncheck("song-#{song3.id}")
  check("song-#{song4.id}")
  click_on "Update Playlist"

  expect(page).to have_content(new_name)
  expect(page).to have_content("#{song1.title}")
  expect(page).to have_content("#{song2.title}")
  expect(page).to have_content("#{song4.title}")
  expect(page).not_to have_content("#{song3.title}")
  end
end
