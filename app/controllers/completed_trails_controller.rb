class CompletedTrailsController < ApplicationController
  def index
    @completed_trails = CompletedTails.where(user_id: @user.id)
    render json: @completed_trails
  end

  def show
    @completed_trail = CompletedTails.find(params[:id])
    render json: @completed_trail
  end

  def create
    @completed_trail = CompletedTails.new({
      user_id: @user.id,
      trail_id: params[:trail_id],
      trail_type: params[:trail_type]
    })

    if @completed_trail.valid?
        @completed_trail.save
        render json: {completed_trail: @completed_trail}, status: :created
    else
        render json: @completed_trail.errors.full_messages
    end
  end

  def update
    @completed_trail = CompletedTails.find(params[:id])
    @completed_trail.update(completed_trail_params)
    render json: @completed_trail
  end

  def destroy
    @completed_trail = CompletedTails.find(params[:id])
    @completed_trail.destroy
    render json: {message: "Removed trail."}
  end

  private

  def completed_trails_params
    params.require(:completed_trail).permit([:trail_id, :trail_type, :note, :rating])
  end

end
