class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todos = Todo.new
  end

  def create
    @todos = Todo.new(todos_params)
    if @todos.save
      redirect_to todos_path,                notice:'se ha creado un nuevo ToDo'
    else
      redirect_to todos_new_path,            notice:'no se ha creado un nuevo Todo'
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
  end


private
  def todos_params
    params.require(:todo).permit(:description)
  end


end
