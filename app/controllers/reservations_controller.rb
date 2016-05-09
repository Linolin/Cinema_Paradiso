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

  private

  def reservation_params
  	params.require(:reservation).permit(:user, :show, :seats)
  end
end
