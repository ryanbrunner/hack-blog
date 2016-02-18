class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    if post_params[:title].blank?
      render text: 'You need to provide a title'
    elsif post_params[:content].blank?
      render text: 'You need to provide content'
    else
      Post.create(post_params)
      redirect_to root_path
    end
  end
  
  # /posts/:id -> params[:id] 
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    if post_params[:title].blank?
      render text: 'You need to provide a title'
    elsif post_params[:content].blank?
      render text: 'You need to provide content'
    else
      @post = Post.find(params[:id])
      @post.update(post_params)
    
      redirect_to root_path
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
