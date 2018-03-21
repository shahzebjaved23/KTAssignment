require 'warden/test/controller_helpers'

module ControllerHelpers
    include Warden::Test::Helpers

    def sign_in(user)
		if user.nil?
			allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
			allow(controller).to receive(:current_user).and_return(nil)
		else
			allow(request.env['warden']).to receive(:authenticate!).and_return(user)
			allow(controller).to receive(:current_user).and_return(user)
		end
    end
end

