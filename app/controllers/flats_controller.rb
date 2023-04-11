class FlatsController < ApplicationController
  before_action :find_id, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
    @user = current_user.id
  end

  def create
    @flat = Flat.new(permit)
    # raise
    @flat.user_id = current_user.id
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_id
    @flat = Flat.find([:id])
  end

  def permit
    params.require(:flat).permit(:city, :address, :description, :price, :gears, :user_id, :photo)
  end
end
