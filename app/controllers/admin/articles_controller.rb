class Admin::ArticlesController < Admin::BaseController

  def index

  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    @user = current_user
    if @article.save!
      respond_to do |f|
        f.html {redirect_to '/admin/dashboard'}
      end
    else
      redirect_to '/admin/articles/new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to admin_article_path(@article)
    else
      redirect_to edit_admin_article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to '/admin/dashboard'
    else
      redirect_to '/admin/articles'
    end
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :headline, :header, :body)
  end
end
