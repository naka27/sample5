class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    #Favariteクラスのインスタンスfavoriteを生成する
    favorite.user_id = current_user.id
    #favorite.user_idに　現在ログインしているuser(current_user)のidを代入する
    favorite.topic_id = params[:topic_id]
    #favorite.topic_idにparams[:topics_id]を代入する、topicの番号
    
    
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  def destroy
    @favorite = current_user.favorites.find_by(topic_id: params[:topic_id])
    @favorite.destroy
  end
end