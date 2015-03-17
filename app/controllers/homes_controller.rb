class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, :only => [:index]
  respond_to :html

  def index
    @doctors = Doctor.all
    respond_with( @doctors)
  end

  def show
    respond_with(@home)
  end

  def new
    @home = Home.new
    respond_with(@home)
  end

  def edit
  end

  def create
    @home = Home.new(home_params)
    @home.save
    respond_with(@home)
  end

  def update
    @home.update(home_params)
    respond_with(@home)
  end

  def destroy
    @home.destroy
    respond_with(@home)
  end

  private
    def set_home
      @home = Home.find(params[:id])
    end

    def home_params
      params.require(:home).permit(:index)
    end
end
