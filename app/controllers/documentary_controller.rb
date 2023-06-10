class DocumentaryController < ApplicationController
  def index
    @documentaries = Documentary.all
  end

  def new
    @documentary = Documentary.new
  end

  def documentary_params
    params.require(:documentary).permit(:name, :director)
  end

  def create
    @documentary = Documentary.new(documentary_params)#(params.require(:documentaries).permit(:name, :director))
  
    if @documentary.save
      redirect_to '/pages/index'
    else
      render :new      
    end
  end
end
