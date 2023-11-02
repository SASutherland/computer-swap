class ComputersController < ApplicationController
  def show
    @computer = Computer.find(params[:id])
    @booking = Booking.new

    if current_user
      @marker =
        [{
          lat: current_user.latitude,
          lng: current_user.longitude
        }]
    end
  end

  def new
    @computer = Computer.new
  end

  def create
    @computer = Computer.new(computer_params)
    @computer.user = current_user
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
end
