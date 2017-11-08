class CommentsController < ApplicationController
  before_action :find_post

  def create
      @comment = @micropost.comments.create(comment_params)
      @comment.user_id = current_user.id
      @comment.save

      if @comment.save
        redirect_to root_url
      else
        render "static_pages/home"
      end
  end

  private

    def find_post
      @micropost = Micropost.find(params[:micropost_id])
    end

    def comment_params
        params.require(:comment).permit(:content, :user_id, :micropost_id)
   end

end
