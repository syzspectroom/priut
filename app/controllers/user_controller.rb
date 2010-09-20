class UserController < ApplicationController
  def index

  end
  
  def show
    @user= User.first(:conditions => { :name => params[:id] })
    raise 'error' if @user.nil?
    
  end
end
