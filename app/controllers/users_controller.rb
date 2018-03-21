class UsersController < ApplicationController

	before_action :authenticate_with_token!
end