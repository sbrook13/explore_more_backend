class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: @user.id)
    render json: @favorites
  end

  def show
    @favorite = Favorite.find(params[:id])
    render json: @favorite
  end

  def create
    @favorite = Favorite.new({
      user_id: @user.id,
      trail_id: params[:trail_id],
      trail_type: params[:trail_type]
    })

    if @favorite.valid?
        @favorite.save
        render json: {favorite: @favorite}, status: :created
    else
        render json: @favorite.errors.full_messages
    end
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(favorite_params)
    render json: @favorite
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    render json: {message: "Removed trail."}
  end

  private

  def favorite_params
    params.require(:favorite).permit([:trail_id, :trail_type])
  end

end
