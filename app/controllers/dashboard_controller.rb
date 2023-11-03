class DashboardController < ApplicationController

  def index
    @bookings = Booking.all
    @computers = Computer.all
  end

  def show
    @computers = current_user.computers
    @bookings = current_user.bookings
  end
end
