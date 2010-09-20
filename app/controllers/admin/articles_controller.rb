class Admin::ArticlesController < ApplicationController
  require_role [:admin]
  layout 'admin'
#  before_filter :find_user

  def index
    @articles = Article.paginate :page => params[:page]
#    articles_search
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

def search
  articles_search
  render :action => 'index'
end


  protected

  def find_user
    unless logged_in?
      flash[:notice] = '未登录'
      redirect_to login_path
    end
  end

  def articles_search
    conds , conds_h = [],[]

    unless params[:title].blank?
      conds << " (title like ? or short_title like ?)"
      conds_h << "%#{params[:title]}%"
      conds_h << "%#{params[:title]}%"
    end

    unless params[:user_login].blank?
      conds << " users.login like ?"
      conds_h << "%#{params[:user_login]}%"
    end

    unless params[:start_time].blank?
      conds << " DATE_FORMAT(created_at,'%%Y-%%m-%%d') >= '#{params[:start_time]}'"
    end

    unless params[:end_time].blank?
      conds << " DATE_FORMAT(created_at,'%%Y-%%m-%%d') <= '#{params[:end_time]}'"
    end
    
    unless params[:search].blank?
      params[:search].each do |k,v|
        unless v.blank?
          conds << " #{k} = ?"
          conds_h << v
        end
      end
    end

    @articles = Article.paginate(:include=>:user,:conditions => [conds.join(' and '),conds_h],:page => params[:page],:order => 'articles.created_at desc')

  end

end
