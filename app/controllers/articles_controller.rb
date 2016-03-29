class ArticlesController < ApplicationController
  def new
    # equals to class name
    @article = Article.new
  end
  
  # create new article
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  # show by :id
  def show
    @article = Article.find(params[:id])
  end
  
  
  private 
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end