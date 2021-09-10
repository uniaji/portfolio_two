class PostsController < ApplicationController
  before_action :authenticate_user!

  protect_from_forgery :except => [:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '新しく投稿しました！'
    else
      flash[:alert] = "投稿ができませんでした"
      render :new
    end
  end

  def user
    User.find(id: self.user_id)
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '投稿を編集しました！'
    else
      flash[:alert] = "編集ができませんでした"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました'
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content).merge(user_id: current_user)
    end

end
