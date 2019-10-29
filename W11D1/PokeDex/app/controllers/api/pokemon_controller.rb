class Api::PokemonController < ActionController::Base
  
  def index
    @pokemon = Pokemon.all
    render :index
  end
  
  def show
    @poke = Pokemon.includes(:items).find(params[:id])
    render :show
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :attack, :defense, :poke_type, :moves, :image_url)
  end
end