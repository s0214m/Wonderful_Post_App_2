class MypageController < ApplicationController
  def index
    @articles = Article.where(user_id: current_user.id).page(params[:page]).per(25)
  end
end
