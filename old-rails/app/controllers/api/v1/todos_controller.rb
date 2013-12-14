module Api
  module V1
    class TodosController < ApplicationController
      before_filter :ensure_authenticated_user
      respond_to :json

      def index
        @todos = current_user.todos
        respond_with @todos
      end

      def show
        @todos = current_user.todos.find(params[:id])
        respond_with @todos
      end

      def create
        @todo = current_user.todos.create(todo_params)
        respond_with @todo, location: nil
      end

      def update
        @todo = current_user.todos.find(params[:id])
        respond_with @todo.update(todo_params), location: nil
      end

      def destroy
        @todo = current_user.todos.find(params[:id])
        respond_with @todo.destroy, location: nil
      end

    private

      def todo_params
        params.require(:todo).permit(:title, :is_completed)
      end
    end
  end
end
