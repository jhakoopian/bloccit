class PostsController < ApplicationController
  before_action :require_sign_in, except: :show
  before_action :can_edit, only: [:edit, :update]
  before_action :can_destroy, only: [:destroy]
  before_action :set_topic

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def authorize_user
    post = Post.find(params[:id])

    unless current_user == post.user || current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to [post.topic, post]
    end
  end

  def can_edit
    unless current_user.admin? || current_user.moderator? || (post.user == current_user)
      flash[:alert] = "You must be an admin, moderator or author of this post to do that."
      redirect_to topics_path
    end
  end

  def can_destroy
    unless current_user.admin?  || (post.user == current_user)
      flash[:alert] = "You must be an admin or author of this post to do that."
      redirect_to topics_path
    end
  end
end
