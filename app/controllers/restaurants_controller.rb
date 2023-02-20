class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # CRUD -> read WHERE
  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  # CRUD -> read - show page for a chef
  def chef
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    # params[:id] is coming from the URL
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # this is just a page for a form
    @restaurant = Restaurant.new
  end

  def create
    # This actions DOES NOT have a view
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # this is just a page for a form
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

end
