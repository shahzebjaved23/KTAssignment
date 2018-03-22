class SessionsController < ApplicationController

	def create
		@user = User.find_by(email: session_params[:email])
		if @user.present? && @user.valid_password?(session_params[:password])
			render json: { user: @user }
		else
			render json: { message: "invalid email or password" }, status: 422
		end
	end

	private 

	def session_params
		params.require(:user).permit(:email, :password)
	end

end