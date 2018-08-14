class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    @comments = @topic.comments
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      redirect_to @topic
    else
      flash.now[:danger] = "失敗しました"
      render 'topics/show'
    end
  end

  def new
  end

  def destroy
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :topic_id)
  end
end
