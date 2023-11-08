class DashboardController < ApplicationController
  before_action :authenticate_user

  def index
    @bookings = Booking.all
    @computers = Computer.all
  end

  def show
    @computers = current_user.computers
    @bookings = current_user.bookings
  end

  def authenticate_user
    unless user_signed_in?
      flash[:alert] = "You need to be logged in to access the dashboard."
      redirect_to root_path
    end
  end
end
