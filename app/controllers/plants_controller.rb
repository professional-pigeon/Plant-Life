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
    @user = current_user
    @plant = @user.plants.new
    render :new
  end

  def create
    @user = current_user
    @plant = @user.plants.new(plant_params)
    @plant.photo.attach(params[:plant][:photo])
    if @plant.save
      flash[:notice] = "Plant added!"
      redirect_to plants_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    @plant = Plant.find(params[:id])
    render :show
  end

  def edit
    @user = current_user
    @plant = Plant.find(params[:id])
    render :edit
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      flash[:notice] = "Plant updated!"
      redirect_to plant_path
    else
      @user = current_user
      flash[:notice] = "Update failed. Please try again"
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    flash[:notice] = "Plant deleted!"
    redirect_to plants_path
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :category, :health, :health_next_update, :photo)
  end
end