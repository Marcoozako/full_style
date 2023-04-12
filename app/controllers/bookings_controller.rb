class BookingsController < ApplicationController

  before_action :find_me, only: %i[show: edit: update: destroy:]

  def index
    @booking = current_user.bookings
    @flat = current_user.flats
  end

  def show
  end

  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(permit_book)
    @booking.user_id = current_user.id
    @booking.flat_id = @flat.id
    if @booking.save
      redirect_to flats_path
    else
      redirect_to new_flat_booking_path(params[:flat_id]), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(permit_book)
      redirect_to booking_path(@booking.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to flat_path(@booking.flat), status: :see_other
  end

  private

  def permit_book
    params.require(:booking).permit(:begin_date, :end_date, :number_of_guests, :flat_id, :user_id)
  end

  def find_me
    @booking = Booking.find(params[:id])
  end
end
