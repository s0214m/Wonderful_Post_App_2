class MypageController < ApplicationController
  def index
    @articles = Article.where(user_id: current_user.id).page(params[:page]).per(25)
   #@articles = current_user.articles.page(params[:page]).per(25)
  end

  def search
    @articles = Article.where(user_id: current_user.id).search(params[:title]).page(params[:page]).per(25)
    render "index"
  end
end
