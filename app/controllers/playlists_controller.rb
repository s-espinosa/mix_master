class PlaylistsController < ApplicationController
  before_action :find_playlist, only: [:show, :edit, :update]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @submit   = "Create Playlist"
  end

  def create
    @playlist = Playlist.create(playlist_params)
    if @playlist.save
      redirect_to playlist_path(@playlist.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @submit   = "Update Playlist"
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to playlist_path(@playlist.id)
    else
      render :edit
    end
  end

  private
  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end
end
