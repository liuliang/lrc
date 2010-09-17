class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_filter :find_user
  
  def index
    respond_to do |format|
      format.html # index.html.erb
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
