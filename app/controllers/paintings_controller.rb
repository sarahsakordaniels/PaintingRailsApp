class PaintingsController < ApplicationController
  before_action :find_painting, only: [:edit, :show, :update, :destroy]

  def index
    if params[:search_term]
      @paintings = Painting.where("name LIKE ?", "%#{params[:search_term]}%")
    else
      @paintings = Painting.all
    end
  end

  def show
  end

  def new
    @painting = Painting.new
    @artists = Artist.all
  end

  def create
    @painting = Painting.create(painting_params)
    if @painting.errors.any?
      @artists = Artist.all
      render :new
    else
      redirect_to paintings_path
    end
  end

  def edit
    @artists = Artist.all
  end

  def update
    @painting.update(painting_params)
    if @painting.errors.any?
      @artists = Artist.all
      render :edit
    else
      redirect_to paintings_path
    end
  end

  def destroy
    @painting.delete
    redirect_to paintings_path
  end

  private

  def find_painting
    @painting = Painting.find(params[:id])
  end

  def painting_params
    params.require(:painting).permit(:name, :artist_id)
  end
end
