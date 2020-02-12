class GossipsController < ApplicationController
  def index
    @gossips = Gossip.includes(:user).all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create 
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.first) 
    if @gossip.save
      flash[:success] = "Woohoo!"
      redirect_to root_path
    else
      flash[:alert] = "Alerting you to the monkey on your car!"
      render 'new'
    end
  end
end
