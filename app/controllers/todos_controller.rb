class TodosController < ApplicationController
    validates :description, presence:true
  
  def index
    @todos = Todo.all
  end

  def new
    @todos = Todo.new
  end

  def create
    @todos = Todo.new(todos_params)
    if @todos.save
      redirect_to todos_path,                notice:'Se ha creado un nuevo ToDo'
    else
      redirect_to todos_new_path,            notice:'No se ha creado un nuevo Todo'
    end
  end

  def show
    @todos = Todo.find(params[:id])
  end

  def edit
    @todos = Todo.find(params[:id])

  end

  def update
    @todos = Todo.find(params[:id])
    if @todos.update(todos_params)
      redirect_to root_path
    else
      redirect_to edit_todo_path
    end
  end

  def destroy
    @todos = Todo.find(params[:id])
    @todos.destroy
    redirect_to todos_path, notice:'El registro se a eliminado con exito'
  end

  def completed
    @todos = Todo.find(params[:id])
  end

  def list
    @todos = Todo.all
  end

private
  def todos_params
    params.require(:todo).permit(:description)
  end


end
