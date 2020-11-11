class Api::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = current_user.comments.create(comments_params)
    if comment.persisted?
      render json: { message: "succesfully saved" }, status: 201
    else
      console.log(error)
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :article_id, :user_id)
  end
end
