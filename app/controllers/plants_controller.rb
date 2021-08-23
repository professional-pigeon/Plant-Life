class PlantsController < ApplicationController
  before_action :authenticate_user!
  # before_action except: [:new, :create, :show] do 
  #   unless is_user?
  #     flash[:alert] = 'You do not have access to my plants!'
  #       redirect_to plants_path
  #     end 
  #   end 

  def index
    @user = current_user
    @plants = @user.plants
    render :index
  end 

  def new
    @user = User.find(params[:user_id])
    @plant = @user.plants.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @plant = @user.reviews.new(plant_params)

    if @plant.save
      flash[:notice] = "Plant added!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @plant = Plant.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:user_id])
    @plant = Plant.find(params[:id])
    render :edit
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(review_params)
      flash[:notice] = "Plant updated!"
      redirect_to user_plants_path(@plant.user)
    else
      @user = User.find(params[:user_id])
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    flash[:notice] = "Plant deleted!"
    redirect_to user_path(@plant.user)
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :category, :health)
  end
end