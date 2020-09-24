class FlatsController < ApplicationController
  before_action :set_flat, only: [:edit, :update, :destroy]

  def show
    if current_user.flat
      @flat = current_user.flat
      authorize @flat
    else
      skip_authorization
      redirect_to new_flat_path
    end

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
    user_hash = user.attributes
    if user.photo.attached?
      user_hash["image_url"] = "https://res.cloudinary.com/dinkluxtp/image/upload/#{user.photo.key}.png"
    else
      user_hash["image_url"] = "http://localhost:3000/assets/default_avatar.png"
    end

    skip_authorization
    render json: user_hash
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
