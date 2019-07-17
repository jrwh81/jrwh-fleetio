Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  scope '/api' do
  	resources :vehicles

  	get 'vehicles/find/:vin', :to => 'vehicles#find', as: 'find_by_vin'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	get '*path', to: "application#fallback_index_html", constraints: ->(request) do
	  !request.xhr? && request.format.html?
	end
end
