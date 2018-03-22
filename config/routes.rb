Rails.application.routes.draw do
	
	post "login" => "sessions#create"

	resources :users , only: [:create]
	

end
