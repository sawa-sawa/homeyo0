class MypageController < ApplicationController
  def index
    @tasks = current_user.tasks.order('due_date')
    @finish_tasks = current_user.tasks.completed.order(completed_at: :desc)
  end
end
