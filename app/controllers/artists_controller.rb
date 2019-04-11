

class ArtistsController < ApplicationController

  def index
    if params[:search_term]
    @artists =  Artist.where("name LIKE ?", "%#{params[:search_term]}%")
  else
    @artists = Artist.all
    end
    api_data
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artists_path
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to artists_path
  end

  def destroy
    @artist = Artist.find(params[:id])
    @paintings = Painting.all.select do |painting|
      painting.artist == @artist
    end
    @paintings.each do |painting|
      painting.delete
    end
    @artist.delete
    redirect_to artists_path
  end


private

  def artist_params
    params.require(:artist).permit(:name, :style)
  end

  def api_data
    @url = "http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3"
    response = RestClient.get(@url)
    @data = JSON.parse(response)
    @data = @data["results"]
  end
end
