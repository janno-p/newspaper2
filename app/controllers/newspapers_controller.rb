class NewspapersController < ApplicationController
  def index
    @newspapers = Newspaper.all
  end

  def edit
    @newspaper = Newspaper.find_by_id(params[:id])
    render :error if @newspaper.nil?
  end

  def update
  end

  def show
  end
end
