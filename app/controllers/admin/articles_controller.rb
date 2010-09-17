class Admin::ArticlesController < ApplicationController
  layout 'admin'
  before_filter :find_user

  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @article = Article.new(:is_publised=>1,:is_verify=>1)

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
    
    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to admin_article_url(@article) }
      else
        flash[:error] = 'error'
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(admin_article_url @article) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to(admin_articles_url) }
    end
  end

protected

  def find_user
    unless logged_in?
      flash[:notice] = '未登录'
      redirect_to login_path
    end
  end

end
