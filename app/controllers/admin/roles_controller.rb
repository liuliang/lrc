class Admin::RolesController < ApplicationController
  require_role [:admin]
  layout 'admin'
#  before_filter :find_user

  def index
    @roles = Role.paginate :page => params[:page], :order => 'created_at desc'
#    Roles_search
    respond_to do |format|
      format.html # index.html.erb
    end
    
  end

  def new
    @role = Role.new
    @is_new = 'true'
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def create
    @role = Role.new(params[:role])
    
    respond_to do |format|
      if @role.save
        flash[:notice] = 'Role was successfully created.'
        format.html { redirect_to admin_roles_url }
      else
        flash[:error] = 'error'
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        flash[:notice] = 'Role was successfully updated.'
        format.html { redirect_to(admin_roles_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    respond_to do |format|
      format.html { redirect_to(admin_roles_url) }
    end
  end
  
end
