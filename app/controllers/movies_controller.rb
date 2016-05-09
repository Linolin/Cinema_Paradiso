class MoviesController < ApplicationController
	before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
  	@movies = Movie.includes(:shows).order('shows.datetime ASC')
  end

  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(movie_params)
    @movie.trailer_url = sanitize_trailer_url(@movie.trailer_url)
  	if @movie.save
  		redirect_to @movie
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
    authenticate_user!
  end

  def update
		if @movie.update(movie_params)
      @movie.trailer_url = sanitize_trailer_url(@movie.trailer_url)
      @movie.save
			redirect_to @movie
		else
			render 'edit'
		end
  end

  def destroy
  	@movie.destroy
  	redirect_to movies_path
  end

  private

  def find_movie
  	@movie = Movie.find(params[:id])
  end

  def sanitize_trailer_url(url)
    url.remove!("https://www.youtube.com/watch?v=")
    url.remove!("http://www.youtube.com/watch?v=")
    url.remove!("www.youtube.com/watch?v=")
    url.remove!("youtube.com/watch?v=")
  end

  def movie_params
  	params.require(:movie).permit(:title, :poster, :plot, :duration, :director, :genere, :trailer_url, actors_attributes: [:id, :name, :_destroy], shows_attributes: [:id, :datetime, :theater_id, :price, :_destroy])
  end
end
