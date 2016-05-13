class ReservationsController < ApplicationController
	def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
  	if @reservation.save
  		redirect_to @reservation
  	else
  		render 'new'
  	end
  end

  def index
    authenticate_user!
    time_range = DateTime.now...(DateTime.now + 365.day)
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  def get_seats
    @string = params[:string] || session[:string] 
    respond_to do |format|
      if @string  
       redirect_to @reservation
      else 
       render 'new'
      end
    end
  end

  def api_index_seats
    @show = Show.find(params[:show_id])
    @seats = Seat.includes(:reservations).where('reservations.show_id' => @show.id)
    render json: @seats, status: :ok
  end

  private

  def reservation_params
  	params.require(:reservation).permit(:user, :show, :seats)
  end
end
