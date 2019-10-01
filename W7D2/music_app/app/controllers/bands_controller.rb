class BandsController < ApplicationController
 

  def index
    @bands= Band.all 
    render :index
  end

  def show
    
  end

  def new
    render :new
  end

  def create

  end

  def edit
  
  end

  def update

  end
    
  def destroy 

  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
