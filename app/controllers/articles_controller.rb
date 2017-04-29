class ArticlesController < ApplicationController
  before_action :require_user_logged_in
  
  def show
  end
  
  def new
    @article = Article.new({ :movie_title => params['title'], :movie_id => params['id'], :poster_url => params['poster_path'] })
    p @article
  end

  def create
    @article = current_user.articles.build(article_params)
    
    if @article.save
      flash[:success] = '記事を投稿しました'
      redirect_to root_url
    else
      flash.now[:danger] = '記事が投稿されませんでした'
      render :new
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:movie_title, :article_title, :director, :performer, :content, :release_date, :movie_id, :poster_url )
  end
  
end