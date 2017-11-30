class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end  

  def new
    @post = Post.new
  end
  
  def create
    
    @post = Post.new
    @post.assign_attributes(post_params)
   
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to @post
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
      render :show
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    
    if @post.save
      flash[:notice] = "You wiki has been updated."
      redirect_to @post
    else
      flash.now[:alert] = "There was an Error editing your Wiki."
      render :edit
    end
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :link)
  end

end
