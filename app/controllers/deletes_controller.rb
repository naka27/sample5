class DeletesController < ApplicationController
  def destroy
    delete = Delete.new
    delete = Delete.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    delete.destroy
    flash[:success] = "お気に入りを解除しました"
    redirect_to topics_path
  end
end
