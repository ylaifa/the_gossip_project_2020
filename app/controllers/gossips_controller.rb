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
    @gossip = Gossip.new(gossip_params.merge(user: User.first)) 
    if @gossip.save
      flash[:notice] = 'New gossip created !'
      redirect_to root_path
    else
      flash[:alert] = @gossip.errors.full_messages
      render 'new'
    end
  end

  def edit 
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params.merge(user: User.first))
      flash[:notice] = 'gossip updated !'
      redirect_to @gossip
    else
      flash[:alert] = @gossip.errors.full_messages
      render 'edit'
    end
  end

  private
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end
end
