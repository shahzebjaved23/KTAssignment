Rails.application.routes.draw do
	
	post "login" => "sessions#create"
	get "summary" => "trips#summary"

	resources :users , only: [:create]
	resources :trips , only: [:index, :create]
	resources :trucks, only: [:index]

end
