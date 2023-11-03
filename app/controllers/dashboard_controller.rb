class DashboardController < ApplicationController

  def index
    @bookings = Booking.all
    @computers = Computer.all
  end


  def show
    @computers = Computer.all
    @computer = Computer.last

    if @bookings.any?
      @bookings = current_user.bookings
    else
      @bookings = nil
    end

    if @bookings.any?
      @booking = @bookings.last
    else
      @booking = nil
    end
  end
end
