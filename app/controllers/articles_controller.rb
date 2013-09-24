class ArticlesController < ApplicationController
 	before_filter :authenticate_member!
  def new
  	@article = Article.new
  end

  def index
  	@articles = Article.all
  end
  def show
  	@article = Article.find(params[:id])
  end
  def create 
  	@article = Article.new
  	@article.title = params[:article][:title]
  	@article.body = params[:article][:body]
  	@article.save
  	redirect_to article_path(@article)
  end 
  def destroy
  @articledestroy = Article.find(params[:id])
  @articledestroy.destroy
  flash.notice = "Data deleted successfully "
  redirect_to articles_path
  end
  def edit
  	@article = Article.find(params[:id])
  end
  def update
  	@article = Article.find(params[:id])
  	  	@article.update_attributes(params[:article])
  	  	redirect_to articles_path
  end


end
