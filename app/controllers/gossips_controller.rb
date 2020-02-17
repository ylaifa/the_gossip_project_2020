class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

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
    @gossip = Gossip.new(gossip_params) 
    @gossip.user = current_user
    @gossip.tags << Tag.find(params[:tags_id])
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
    @gossip.tags << Tag.find(params[:tags_id])
    if @gossip.update(gossip_params)
      flash[:notice] = 'gossip updated !'
      redirect_to @gossip
    else
      flash[:alert] = @gossip.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy

    redirect_to root_path
  end

  private
    def gossip_params
      params.require(:gossip).permit(:title, :content, :tag_ids => [])
    end

    def correct_user
      gossip = Gossip.find(params[:id])
      redirect_to root_path unless current_user == gossip.user
    end
end
