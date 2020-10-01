class FlatsController < ApplicationController
  before_action :set_flat, only: [:edit, :update, :destroy]

  def show
    if current_user.flat
      @flat = current_user.flat
      @month = params[:date] ? params[:date][:date] : Date.today.strftime('%B')
      authorize @flat
      @monthly_expenses = @flat.expenses.where(payment_month: @month)
      @total_expenses = @flat.month_total_expenses(@month) + @flat.rent
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
      @flat.set_users_and_rent(params[:flatmate_emails], params[:rent])
      @flat.admin.rent = @flat.rent - params[:rent].map(&:to_i).sum
      @flat.admin.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @flat.update(flat_params)
      @flat.set_users_and_rent(params[:flatmate_emails], params[:rent])
      params[:rent] ||= [0]
      @flat.admin.rent = @flat.rent - params[:rent].map(&:to_i).sum
      @flat.admin.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
  end

  def fetch_mate
    user = User.find_by(email: params[:email])
    user_hash = user ? user.attributes : { email: params[:email] }
    if user && user.photo.attached?
      user_hash["image_url"] = "https://res.cloudinary.com/dinkluxtp/image/upload/#{user.photo.key}.png"
    else
      user_hash["image_url"] = User::DEFAULT_AVATAR
    end

    skip_authorization
    render json: user_hash
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :rent, :photo, :iban)
  end

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end
end
