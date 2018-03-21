module Authenticable

	def authenticate_with_token!
		unless user_signed_in?
			render json: { errors: "Not authenticated" }, status: :unauthorized and return 
		end
	end

	def authenticate_with_hashed_token!
		@email = AesEncryptDecrypt.decryption(request.headers['Authorization'] || request.parameters[:user_token])
		@external_login = true
		render json: { errors: "Not authenticated" },  status: :unauthorized unless user_signed_in?
	end

	def user_signed_in?
		current_user.present?
	end

	def current_user
		user_id = UserAuthToken.find_by(auth_token: self.authentication_token).try :user_id
		@current_user ||= User.find_by(id: user_id) if user_id.present?
	end

	def authentication_token
		@authentication_token ||= request.headers['Authorization'] || request.headers['HTTP_AUTHENTICATION_TOKEN']
	end

	def authorization_token
		@authorization = nil
		if request.headers['Authorization'].present?
			@authorization = request.headers['Authorization']
		elsif request.headers['HTTP_AUTHENTICATION_TOKEN'].present?
			@authorization = request.headers['HTTP_AUTHENTICATION_TOKEN']
		end
	end

end
