class CommentsController < ApplicationController

  before_action :set_message
  before_action :authenticate_user!

  def create
    @comment = @message.comments.build( comment_params )
    @comment.user = current_user

    @comment.save!

    redirect_to :back
  end

  def destroy
    @comment = current_user.comments.find( params[:id] )
    @comment.destroy
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_message
    @message = Message.find( params[:message_id] )
  end

end
