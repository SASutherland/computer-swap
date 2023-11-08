class ComputersController < ApplicationController
  before_action :authenticate_user

  def show
    @computer = Computer.find(params[:id])
    @booking = Booking.new

    @marker = [{ lat: @computer.latitude, lng: @computer.longitude}]
  end

  def new
    @computer = Computer.new
  end

  def create
    @computer = Computer.new(computer_params)
    @computer.user = current_user
    @computer.address = current_user.address
    @computer.latitude = current_user.latitude
    @computer.longitude = current_user.longitude
    @computer.save!
    redirect_to dashboard_path
  end

  def edit
    @computer = Computer.find(params[:id])
  end

  def update
    @computer = Computer.find(params[:id])
    respond_to do |format|
      if @computer.update(computer_params)
        format.html { redirect_to computer_url(@computer), notice: "Computer was successfully updated." }
        format.json { render :show, status: :ok, location: @computer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @computer = Computer.find(params[:id])
    @computer.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def computer_params
    params.require(:computer).permit(:brand, :model, :year, :screen_size , :processor, :ram,  :storage, :category, :os, :price, :description, photos: [])
  end

  def authenticate_user
    unless user_signed_in?
      flash[:alert] = "You need to be logged in to access laptops."
      redirect_to root_path
    end
  end
end
