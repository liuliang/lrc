class Admin::CategoriesController < ApplicationController
  require_role [:admin]
  layout 'admin'
#  before_filter :find_user

  def index
    @categories = Category.paginate :page => params[:page]
#    categorys_search
    respond_to do |format|
      format.html # index.html.erb
    end
    
  end

  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    
    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to admin_categories_url }
      else
        flash[:error] = 'error'
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to(admin_categories_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to(admin_categorys_url) }
    end
  end

end
