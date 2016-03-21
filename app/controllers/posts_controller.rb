class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    
    if params[:q].present?
      @posts = Post.entitled(params[:q])
    else
      @posts = Post.all
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end
  
  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @post }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # /posts/:id -> params[:id] 
  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    # implement destroying a post
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
