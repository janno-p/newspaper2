class NewspapersController < ApplicationController
  def index
    @newspapers = Newspaper.order(:id).all
  end

  def edit
    @newspaper = Newspaper.find_by_id(params[:id])
    render :error if @newspaper.nil?
  end

  def update
    @newspaper = Newspaper.find(params[:id])

    if @newspaper.update_attributes(newspaper_params)
      flash[:success] = true
      redirect_to [:edit, @newspaper]
    else
      render :action => :edit
    end
  end

  def show
  end

  private
    def newspaper_params
      params.require(:newspaper).permit(:name, :founded_at_str, :description)
    end
end
