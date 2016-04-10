require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "display all playlist names and links" do
    playlist1, playlist2, playlist3 = create_list(:playlist, 3)

    visit playlists_path

    within("li:first") do
      expect(page).to have_content(playlist1.name)
    end
    within("li:last") do
      expect(page).to have_link(playlist3.name, href: playlist_path(playlist3.id))
    end
  end
end
