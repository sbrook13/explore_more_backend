class BucketListsController < ApplicationController
  def index
    @bucket_lists = BucketList.where(user_id: @user.id)
    render json: @bucket_lists
  end

  def show
    @bucket_list = BucketList.find(params[:id])
    render json: @bucket_list
  end

  def create
    @bucket_list = BucketList.new({
      user_id: @user.id,
      trail_id: params[:trail_id],
      trail_type: params[:trail_type]
    })

    if @bucket_list.valid?
        @bucket_list.save
        render json: {bucket_list: @bucket_list}, status: :created
    else
        render json: @bucket_list.errors.full_messages
    end
  end

  def update
    @bucket_list = BucketList.find(params[:id])
    @bucket_list.update(bucket_list_params)
    render json: @bucket_list
  end

  def destroy
    @bucket_list = BucketList.find(params[:id])
    @bucket_list.destroy
    render json: {message: "Removed trail."}
  end

  private

  def bucket_list_params
    params.require(:bucket_list).permit([:trail_id, :trail_type])
  end
end
