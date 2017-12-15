class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order("created_at desc").paginate(page: params[:page], per_page: 10)
    else
      @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
  end
  
  def new
    @post = Post.new
    @admin= current_admin
  end
  
  def edit
    @post = Post.find(params[:id])
  end  

  def create
    @post = Post.new
    @admin = current_admin
    @post.assign_attributes(post_params)
    @post.admin = @admin
   
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
      flash[:notice] = "You post has been updated."
      redirect_to @post
    else
      flash.now[:alert] = "There was an error editing your post."
      render :edit
    end
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :link, :tag_list, :slug, :admin_id, :admin_ids => [] )
  end

end
