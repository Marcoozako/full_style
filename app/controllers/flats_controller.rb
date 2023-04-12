class FlatsController < ApplicationController
  before_action :find_id, only: %i[show edit update destroy]

  def index
    @flats = Flat.all.order("created_at DESC")
  end

  def show
    @booking = Booking.new
    # @flat = Flat.find(params[:flat_id])
    @flat = Flat.find(params[:id])
    @bookings = @flat.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.begin_date,
        to:   booking.end_date
      }
    end
  end

  def new
    @flat = Flat.new
    @booking = Booking.new
    @user = current_user.id
  end

  def create
    @flat = Flat.new(permit)
    # raise
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flat_path(@flat.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @flat.user_id = current_user.id
    if @flat.update
      redirect_to flat_path(@flat.id), notice: 'Appointement Update'
    else
      redirect_to flat_path(@flat.id), notice: "The fields have not been respected"
    end
  end

  def destroy
    @flat.user_id = current_user.id
    if @flat.destroy
      redirect_to flats_path
    else
      redirect_to flat_path(@flat.id), status: :unprocessable_entity
    end
  end

  private

  def find_id
    @flat = Flat.find(params[:id])
  end

  def permit
    params.require(:flat).permit(:city, :address, :description, :price, :gears, :user_id, :photo)
  end
end
