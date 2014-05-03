class NewspapersController < ApplicationController
  def index
    @newspapers = Newspaper.all
  end

  def edit
    @newspaper = Newspaper.find(params[:id])
  end

  def update
  end

  def show
  end
end
