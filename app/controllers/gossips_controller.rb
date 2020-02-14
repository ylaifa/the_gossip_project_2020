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
      flash[:notice] = 'New gossip created!'
      redirect_to root_path
    else
      flash[:alert] = @gossip.errors.full_messages
      render 'new'
    end
  end
end
