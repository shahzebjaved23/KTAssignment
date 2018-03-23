class ApplicationController < ActionController::Base

	include Authenticable

	set_current_tenant_through_filter

	def set_current_company
		company = current_user.company
		set_current_tenant(company)
	end
	
end
