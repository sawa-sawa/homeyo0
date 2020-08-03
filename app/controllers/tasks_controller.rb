class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.order('due_date')


    # if @tasks.complete == false
    @other_tasks = Task.where.not(user_id: current_user.id).order(completed_at: :desc).limit(3)
    @finish_tasks = current_user.tasks.completed.order(completed_at: :desc).limit(3)
  end

  def new
    @task = Task.new
  end

  def create
    # binding.pry
    Task.create(task_params)
  end

  def update
    task = Task.find(params[:id])
    if request.referrer.include?("edit")
      task.update(task_params)
    else
      task.update(completed: true , completed_at: Time.now)
      redirect_to tasks_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    task = Task.find(params[:id])
    Task.find(params[:id]).tags.destroy_all
    task.destroy
  end

  private
  def task_params
    params.require(:task).permit(:id, :place_id, :person_id, :target_id, :action_id, :due_date, :memo, :completed, :completed_at, { :tag_ids=> [] }).merge(user_id: current_user.id)
  end

end
