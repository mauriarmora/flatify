class FlatsController < ApplicationController
  before_action :set_flat, only: [:edit, :update, :destroy]

  def show
    @flat = current_user.flat
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.admin = current_user
    authorize @flat

    if @flat.save
      params[:flatmate_ids].each_with_index do |id, i|
        user = User.find(id)
        user.flat = @flat
        user.rent = params[:rent][i]
        user.save
      end
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

  def fetch_mate
    user = User.find_by(email: params[:email])
    skip_authorization
    render json: user
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
