class Admin::SubCategoriesController < ApplicationController
  require_role :admin
  layout 'admin'
  
  def index
    @sub_categories = SubCategory.paginate :page=>params[:page]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @sub_category = SubCategory.new
    @is_new = 'true'
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /categories/1/edit
  def edit
    @sub_category = SubCategory.find(params[:id])
  end

  def create
    @sub_category = SubCategory.new(params[:sub_category])

    respond_to do |format|
      if @sub_category.save
        flash[:notice] = 'SubCategory was successfully created.'
        format.html { redirect_to(admin_sub_categories_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @sub_category = SubCategory.find(params[:id])

    respond_to do |format|
      if @sub_category.update_attributes(params[:sub_category])
        flash[:notice] = 'SubCategory was successfully updated.'
        format.html { redirect_to(admin_sub_categories_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @sub_category = SubCategory.find(params[:id])
    @sub_category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_sub_categories_url) }
    end
  end
end
