class NewspapersController < ApplicationController
  def index
    @newspapers = Newspaper.all
  end

  def edit
  end

  def update
  end

  def show
  end
end
