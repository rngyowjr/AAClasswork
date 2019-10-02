class AlbumsController < ApplicationController
  def new
    band = Band.find(params[:band_id])
    @bands = Band.all
    render :new
  end



  private

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :studio)
  end
end
