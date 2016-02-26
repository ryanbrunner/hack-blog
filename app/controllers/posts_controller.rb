class PostsController < ApplicationController
  def index
    if params[:q].present?
      @ppsts = Post.entitled(params[:q])
    else
      @posts = Post.all
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  # /posts/:id -> params[:id] 
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit    
    end
  end
  
  def new
    @post = Post.new
  end
  
  def post_params
    params.require(:post).permit(:title, :author, :content, :category)
  end
  
  def 💩
    render text: 'poop'
  end
end
