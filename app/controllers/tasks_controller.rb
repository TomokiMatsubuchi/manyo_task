class TasksController < ApplicationController

  def index
    @tasks = Task.desc_create.page(params[:page])
    
    if params[:sort_deadline_on]
      @tasks = Task.deadline.page(params[:page])
    elsif params[:sort_priority]
      @tasks = Task.priority.desc_create.page(params[:page])
    else
      @tasks = Task.desc_create.page(params[:page])
    end


    if  params[:search].present?
      if params["search"]["status"].present? && params["search"]["title"].present?
        @tasks = Task.search_status(params).search_title(params).page(params[:page])
      elsif params["search"]["title"].present?
        @tasks = Task.search_title(params).page(params[:page])
      elsif params["search"]["status"].present?
        @tasks = Task.search_status(params).page(params[:page])
      end
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = t('.Task was successfully created')
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = t('.Task was successfully updated')
      redirect_to tasks_path
    else
      render :edit
    end
  end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      flash[:notice] = t('.Task was successfully destroyed')
      redirect_to tasks_path
    end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline_on, :priority, :status)
  end
end
