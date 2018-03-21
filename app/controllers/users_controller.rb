class UsersController < ApplicationController

	before_action :authenticate_with_token!
	before_action :authenticate_admin_user, only: [:create]

	def create
		@user = User.new(user_params)
		if @user.save
			render json: { message: "user created" }
		else
			render json: { errors: @user.errors.messages }, status: 422
		end
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :role ,:email, :password)
	end

end