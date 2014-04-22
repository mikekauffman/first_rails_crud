class PlayersController < ApplicationController

  def index
    if Player
      @players = Player.all
    end
  end

  def new

  end

  def create
    name = params[:player_name]
    team = params[:player_team]

    player = Player.new
    player.name = name
    player.team = team
    player.save

    redirect_to '/'
  end

  def edit

  end

  def update
    player = Player.find_by(id: params[:id])
    player.name = params[:player_name]
    player.team = params[:player_team]
    player.save
    redirect_to '/'
  end

end