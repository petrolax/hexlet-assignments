# require '../models/article.rb'

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    respond_to do |format|
      format.html # renders index.html.erb
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html # renders show.html.erb
      format.json { render json: @article }
    end
  end
end
