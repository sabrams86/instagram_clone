class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated hombre."
      redirect_to @post
    else
      flash[:alert] = "Something is wrong with your form!"
      render :edit
    end
  end

  def destroy
    if Post.find(params[:id]).destroy
      flash[:success] = "Problem Solved! Post Deleted."
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong.  Please try again."
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
