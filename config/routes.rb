Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
  	resources :gift_wraps
  end
  resources :gift_wraps
end
