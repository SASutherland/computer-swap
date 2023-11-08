class BookingsController < ApplicationController
  before_action :authenticate_user

  def show
    @booking = current_user.bookings.last
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @computer = Computer.find(params[:computer_id])
    @booking.computer = @computer
    if @booking.save!
      redirect_to dashboard_path
    else
      render "computers/show", status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to dashboard_path, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def authenticate_user
    unless user_signed_in?
      flash[:alert] = "You need to be logged in to access your bookings."
      redirect_to root_path
    end
  end
end
