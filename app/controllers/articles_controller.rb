class ArticlesController < ApplicationController
  def new
    
   @article = Article.new
    
  end
  
  def index
    @articles = Article.all
    
  end
  
  def edit
    @article = Article.find(params[:id])
    
  end
  
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
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:notice] = "The article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
      
    end
      
    
  end
  
  def show
    @article = Article.find(params[:id])
    
  end
  
  def destroy
    @article = Article.find(params[:id])
    flash[:notice] = "Article was successfully destroyed"
    
  end
  
  
  private
  
  def article_params
    params.require(:article).permit(:title,:description)
    
  end
  

  
  
end
