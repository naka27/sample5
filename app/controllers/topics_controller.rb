class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
    # 全てのtopicを取得する→投稿一覧画面へ :favorite_usersはモデル
  end
  
  def new
    @topic = Topic.new
    # Topicのnewアクション→投稿画面へ
  end

  def create
    @topic = current_user.topics.new(topic_params)
    # topic_params以下    current_user.topics(topic_params)　現在のユーザーのtopics(topic_params)を@topicに代入
    # t.integer :user_id
    # t.string :description
    # t.string :image

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'     #@topicに格納成功したらtopics_pathへ飛ぶ
    else
      flash.now[:danger] = "投稿に失敗しました"          #失敗したらnewアクション
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end