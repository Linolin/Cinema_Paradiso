class TheatersController < ApplicationController
	before_action :find_theater, only: [:show, :edit, :update, :destroy]

  def index
  	@theaters = Theater.all
  end

  def new
  	@theater = Theater.new
  end

  def create
  	@theater = Theater.new(theater_params)
  	if @theater.save
  		redirect_to @theater
  	else
  		render 'new'
  	end
  end

  def show
  end

  def api_index
    @theaters = Theaters.all
    render json: @theaters, status: :ok
  end

  def api_show
    @theater = Theater.find(params[:id])
    render json: @theater, status: :ok
  end

  def api_index_seats
    @theater = Theater.find(params[:theater_id])
    @seats = Seat.where(theater: @theater)
    render json: @seats, status: :ok
  end

  def edit
  end

  def update
		if @theater.update(theater_params)
			redirect_to @theater
		else
			render 'edit'
		end
  end

  def destroy
  	@theater.destroy
  	redirect_to theaters_path
  end

  private

  def find_theater
  	@theater = Theater.find(params[:id])
  end

  def theater_params
  	params.require(:theater).permit(:name, :seats)
  end
end
