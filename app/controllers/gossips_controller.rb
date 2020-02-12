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
  end
end
