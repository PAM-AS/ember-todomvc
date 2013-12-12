module Api
  module V1
    class SessionController < ApplicationController
      def create
        if params[:grant_type] == "password"
          user = User.where("username = ? OR email = ?", params[:username_or_email], params[:username_or_email]).first
          if user && user.authenticate(params[:password])
            render json: user.session_api_key, status: 201
          else
            render json: {error: "Wrong username or password"}, status: 401
          end
        elsif params[:grant_type] == "facebook_token"
          @facebook_auth = FacebookAuth.where("account_id = ?", params[:user_id]).first
          if @facebook_auth
            @user = @facebook_auth.user
            render json: @user.session_api_key, status: 201
          else
            @user = User.create! name: params[:name], email: params[:email]
            if @user.new_record?
              render json: { errors: @user.errors.messages }, status: 422
            else
              @facebook_auth = @user.facebook_auths.create account_id: params[:user_id], access_token: params[:access_token]
              render json: @user.session_api_key, status: 201
            end
          end
        else
          render json: {error: "Invalid grant type"}
        end
      end
      def default_serializer_options
        {
          root: false
        }
      end
    end
  end
end
