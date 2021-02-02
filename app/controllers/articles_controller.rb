class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(set_article)
  end

  def search
    @articles = Article.where("title LIKE ?", "%#{params[:q]}%")
        # Book.where("title = ?", params[:title])
  end

  def new
    @article = Article.new
  end

  def create
		@article = Article.new(article_params)
		# @article.title = params[:title] #symbol to access params
		# @article.body = params[:body]
		# @article.author = params[:author]
		
		if @article.save
			redirect_to articles_path
		else
			render :new # takes out item if not successful
		end		
  end
  
  def edit
    @article = Article.find(set_article)
  end

  def update
    @article = Article.find(set_article)
    if @article.update(article_params)
      redirect_to articles_path
    else 
      render :edit
    end
  end

  def destroy
    @article = Article.find(set_article)
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    params[:id]
  end
  
  def article_params
    params.require(:article).permit(:title, :body, :author)
  end
end
