class ProfilesController < ApplicationController
  def show
    @user = User.find_by(user_name: params[:user_name])
    @posts = @user.posts.order('created_at DESC').page params[:page]
    respond_to do |format|
      format.html
      format.js { render :layout=>false }
    end
  end

  def edit

  end
end
