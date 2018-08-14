class TopicsController < ApplicationController
  before_action :require_user_logged_in, only: :create 
  before_action :correct_user, only: [:destroy]
  
  def index
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = Comment.new(topic_id: @topic.id)
    @comments = @topic.comments
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = 'トピックを作成しました。'
      redirect_to root_url
    else
      @topics = current_user.topics.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'トピックの作成に失敗しました。'
      render '/'
    end
  end

  def new
  end

  def destroy
    @topic.destroy
    flash[:success] = 'トピックを削除しました。'
    redirect_back(fallback_location: root_path)
  end


private

  def topic_params
    params.require(:topic).permit(:content)
  end
  
  def correct_user
    @topic = current_user.topics.find_by(id: params[:id])
    unless @topic
      redirect_to root_url
    end
  end
end

