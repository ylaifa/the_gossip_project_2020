class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(param[:id])
  end

  def new
    @comment = Comment.new
  end

  def create 
    @comment = Comment.new(content: params[:content], gossip_id: params[:gossip_id], user: current_user)
    @comment.user = current_user
    if @comment.save
      redirect_back(fallback_location: gossip_path(params[:gossip_id]))
    else
      flash[:alert] = @comment.errors.full_messages
      redirect_back(fallback_location: gossip_path(params[:gossip_id]))
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update 
    @comment = Comment.new(content: params[:content], gossip_id: params[:gossip_id], user: current_user)
    if @comment.save
      redirect_to gossip_path(@comment.gossip)
    else
      flash[:alert] = @comment.errors.full_messages
      render edit_gossip_comment_path(gossip_id: @comment.gossip, id: @comment)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to gossip_path(@comment.gossip)
  end

end
