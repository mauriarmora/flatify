class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit]

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat

    if @new_flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  private

  def flat_params
    params.require(:flat).permit(:name)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
