module Authenticable

	def authenticate_with_token!
		unless user_signed_in?
			render json: { errors: "Not authenticated" }, status: :unauthorized and return 
		end
	end
	
	def user_signed_in?
		current_user.present?
	end

	def current_user
		@current_user ||= User.find_by(auth_token: self.authentication_token)
	end

	def authentication_token
		@authentication_token ||= request.headers['Authorization'] || request.headers['HTTP_AUTHENTICATION_TOKEN']
	end

end
