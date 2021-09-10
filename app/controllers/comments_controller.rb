class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'コメントの投稿が完了しました'
    else
      redirect_to post_path(@post), alert: 'コメントの投稿を修正して下さい'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'コメントの編集が完了しました'
    else
      flash[:alert] = 'コメントの編集をやり直して下さい'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: 'コメントを削除しました'
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :name, :post_id)
  end

end
