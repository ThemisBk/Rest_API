class ItemsController < ApplicationController
  before_action :set_todo
  
  def show
    item = @todo.items.find_by(id: params[:id])
    if item
      render json: item
    else
      render json: { error: "Item not found" }, status: :not_found
    end
  end

  def create
    item = @todo.items.new(item_params)
    if item.save
      render json: item, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def update
    item = @todo.items.find_by(id: params[:id])
    if item
      if item.update(item_params)
        render json: item
      else
        render json: item.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Item not found" }, status: :not_found
    end
  end

  def destroy
    item = @todo.items.find_by(id: params[:id])
    if item
      item.destroy
      head :no_content
    else
      render json: { error: "Item not found" }, status: :not_found
    end
  end
  
  private
  
  def set_todo
    @todo = @current_user.todos.find_by(id: params[:todo_id])
    unless @todo
      render json: { error: "Todo not found" }, status: :not_found
    end
  end
  
  def item_params
    params.require(:item).permit(:description, :completed)
  end
end