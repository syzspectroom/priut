class DogsController < ApplicationController
  before_filter :authenticate_user! , :except =>[:show]
  def new
    @dog = Dog.new
    @name=current_user.name
  end

  def show
    @dog = Dog.first(:conditions => { :id => params[:id] })
    raise 'error' if @dog.nil?
  end

  def add
    @dog = Dog.new(params[:dog])
    @dog.user=current_user
    if @dog.save
      flash[:notice] = "Successfully created..."

#      render 'new'
    else
      flash[:error] = "failed"
#      render 'new'
    end
  end
end
