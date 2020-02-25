class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
    #現在のユーザのいいねした投稿を代入する
  end

  def create
    favorite = Favorite.new
    #Favariteクラスのインスタンスfavoriteを生成する
    favorite.user_id = current_user.id
    #favorite.user_idに現在ログインしているuserのidを代入する
    favorite.topic_id = params[:topic_id]
    #いいねしたTopicのidを取得する
    
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    favorite.destroy if favorite.present?
    flash[:success] = "お気に入りを解除しました"
    redirect_to topics_path
  end
end