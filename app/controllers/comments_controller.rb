class CommentsController < ApplicationController
  def create
    @task = Task.find(comment_params[:task_id])
    @comments = @task.comments
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to :back
    else
      render 'tasks/show'
    end
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :task_id, :user_id)
    end
end
