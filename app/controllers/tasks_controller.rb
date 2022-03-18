# app/controllers/tasks_controller.rb

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update({
      title: params[:task][:title],
      description: params[:task][:description]
      })
    task.save
    redirect_to "/tasks/#{task.id}"
  end

  def create

    task = Task.new({
      title: params[:task][:title],
      description: params[:task][:description]
    })

    task.save
    redirect_to '/tasks'
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to '/tasks'
  end
end