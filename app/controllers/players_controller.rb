class PlayersController < ApplicationController

  def index
    if Player
      @players = Player.all
    end
  end

  def new

  end

  def create
    Player.create(name: params[:player_name], team: params[:player_team])
    redirect_to '/players'
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update(name: params[:player_name], team: params[:player_team])
    redirect_to '/players'
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    redirect_to '/players'
  end

end