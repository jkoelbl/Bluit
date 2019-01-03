class TextPostsController < ApplicationController
  include TextPostsHelper

  before_action :if_not_logged, :except => [:index, :show]
  before_action :validate_post_editor, :only => [:edit, :update, :destroy]

  def index
    @text_posts = TextPost.all
    @usernames = get_usernames
  end

  def show
    @is_editor = valid_post_editor?
    @text_post = TextPost.find(params[:id])
    @user = User.find(@text_post.user_profile_id)
  end

  def new
    @text_post = TextPost.new
  end

  def create
    text_post = TextPost.new(text_post_params)
    text_post.user_profile_id = session[:id]
    if text_post.save
      redirect_to text_post
    else
      redirect_to new_text_post_path
    end
  end

  def edit
    @text_post = TextPost.find(params[:id])
  end

  def update
    text_post = TextPost.find(params[:id])
    if text_post.update(text_post_params)
      redirect_to text_post
    else
      redirect_to edit_text_post_path
    end
  end

  def destroy
    if text_post = TextPost.find(params[:id])
      text_post.destroy
      redirect_to root_path
    else
      do_error(:not_found)
    end
  end

  private

  def text_post_params
    params.require(:text_post).permit(
      :title,
      :content
    )
  end
end
