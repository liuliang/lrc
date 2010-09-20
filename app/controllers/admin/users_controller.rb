class Admin::UsersController < ApplicationController
  require_role [:admin]
  layout 'admin'
  
  def index
    @users = User.paginate :page => params[:page], :order => 'created_at desc'
    
    respond_to do |format|
      format.html # index.html.erb
    end
    
  end

#  def new
#    @user = User.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#    end
#  end

  def show
     @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

#  def create
#    @user = User.new(params[:role])
#
#    respond_to do |format|
#      if @user.save
#        flash[:notice] = 'User was successfully created.'
#        format.html { redirect_to admin_user_url(@user) }
#      else
#        flash[:error] = 'error'
#        format.html { render :action => "new" }
#      end
#    end
#  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(admin_user_url(@user)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
    end
  end
  
end
