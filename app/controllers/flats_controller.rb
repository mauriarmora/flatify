class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @flat = Flat.new
    authorize @flat
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

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
  end

  private

  def flat_params
    params.require(:flat).permit(:name)
  end

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end
end
