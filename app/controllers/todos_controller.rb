class TodosController < ApplicationController
  def index
    render json: @current_user.todos
  end

  def create
    todo = @current_user.todos.new(todo_params)
    if todo.save
      render json: todo, status: :created
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def show
    todo = @current_user.todos.find_by(id: params[:id])
    if todo
      render json: todo
    else
      render json: { error: "Todo not found" }, status: :not_found
    end
  end

  def update
    todo = @current_user.todos.find_by(id: params[:id])
    if todo
      if todo.update(todo_params)
        render json: todo
      else
        render json: todo.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Todo not found" }, status: :not_found
    end
  end

  def destroy
    todo = @current_user.todos.find_by(id: params[:id])
    if todo
      todo.destroy
      head :no_content
    else
      render json: { error: "Todo not found" }, status: :not_found
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end