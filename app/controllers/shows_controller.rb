class ShowsController < ApplicationController

	def index
  	@shows = Show.all.order("datetime ASC")
    @reservations = Reservation.all
  end

  def new
  	@show = Show.new
  end

  def show
  	@show = Show.find(params[:id])
  end

  def reserve
    authenticate_user!
    @seatsString = params[:seatsToReserve] || session[:seatsToReserve]
    @show = Show.find(params[:id])
      if @seatsString && @seatsString != "" && @seatsString.length % 3 == 0
      	alreadyReserved = false
        if DateTime.now > @show.datetime - 30.minutes && !current_user.admin
          redirect_to @show.movie, alert: "È possible prenotare i biglietti solo fino a 30 minuti prima dell’inizio di ogni spettacolo."
        elsif DateTime.now > @show.datetime + 20.minutes
          redirect_to @show.movie, alert: "Non è più possibile prenotare i biglietti di questo spettacolo."
        else
         	reservation = Reservation.new(user: current_user, show: @show)
         	(0..((@seatsString.length - 3) / 3)).each do |i|
          	seatString = @seatsString.slice(3 * i, 3 * (i + 1))
          	row = seatString.slice(0, 1)
            p row
          	number = seatString.slice(1, 2)
            p number
          	seat = @show.theater.seats.where(row: row).where(number: number).take
          	if seat.reservations.where(show: show).exists?
          		alreadyReserved = true
          	end
          	reservation.seats << [seat]
          	reservation.save
          end
          if alreadyReserved
          	redirect_to @show, alert: "Uno dei posti scelti è stato prenotato nel frattempo. Per favore effettuare una nuova selezione."
          else
          	redirect_to reservation
          end
        end
      else 
        redirect_to @show
      end
  end

  def destroy
    @show = Show.find(params[:id])
    @show.destroy
  end

  def api_index
    time_range = (DateTime.now.beginning_of_day())..((DateTime.now + (6 * 24).hours).end_of_day())
    @shows = Show.all.where('datetime' => time_range).order("datetime ASC")
    render json: @shows, status: :ok
  end

  def api_show
    @show = Show.find(params[:id])
    render json: @show, status: :ok
  end

  def api_reserve_seats
    @user = User.find_by_email(params[:email])
    if @user && @user.valid_password?(params[:password])
      @seatsString = params[:seats]
      @show = Show.find(params[:id])
      if @seatsString && @seatsString != "" && @seatsString.length % 3 == 0
        alreadyReserved = false
        if DateTime.now > @show.datetime - 30.minutes && !current_user.admin
          render json: "È possible prenotare i biglietti solo fino a 30 minuti prima dell’inizio di ogni spettacolo", status: :bad_request
        else
          reservation = Reservation.new(user: @user, show: @show)
          (0..((@seatsString.length - 3) / 3)).each do |i|
            seatString = @seatsString.slice(3 * i, 3 * (i + 1))
            row = seatString.slice(0, 1)
            p row
            number = seatString.slice(1, 2)
            p number
            seat = @show.theater.seats.where(row: row).where(number: number).take
            if seat.reservations.where(show: @show).exists?
              alreadyReserved = true
            end
            reservation.seats << [seat]
            reservation.save
          end
          if alreadyReserved
            render json: "Uno dei posti scelti è stato prenotato nel frattempo", status: :bad_request
          else
            render json: reservation, stauts: :ok
          end
        end
      else 
        render json: "Si è verificato un errore", status: :bad_request
      end
    elsif
      render json: "Email o password non corrette", status: :unauthorized
    end
  end
end