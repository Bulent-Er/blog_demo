class UsersController < ApplicationController
  before_action :set_user
  def profile
    @user.update(views: @user.views + 1)
    @posts = @user.posts.includes(:rich_text_body).order(created_at: :desc)
    @total_views = @posts.sum(:views)
  end

  private
  def set_user
    @user =User.friendly.find(params[:id])
  end
end
