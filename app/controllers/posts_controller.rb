class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
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
    @post = current_user.posts.build(post_params)
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
    params.require(:post).permit(:title, :user_id, :content, :category)
  end
  
  def 💩
    render text: 'poop'
  end
end
