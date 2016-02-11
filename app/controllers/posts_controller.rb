class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    Post.create({
      title: params[:post][:title],
      content: params[:post][:content],
      author: params[:post][:author],
      category: params[:post][:category]
    })
    redirect_to root_path
  end
  
  def new
    @post = Post.new
  end
  
  def 💩
    render text: 'poop'
  end
end
