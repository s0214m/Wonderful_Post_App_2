class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show ]
  # GET /articles

  def index
    @articles = Article.includes(:tags).page(params[:page]).per(25)
  end

  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    binding.pry
    @article = current_user.articles.new(article_params)
      respond_to do |format|
        if @article.save
          format.html { redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}を作成しました" }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /articles/1 or /articles/1.json

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}を編集しました" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "#{t('activerecord.models.article')}を削除しました" }
    end
  end

  def search
    @articles = Article.search(params[:title]).page(params[:page]).per(25)
    render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by(id: params[:id], user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, tag_ids: [])
    end
end
