Rails.application.routes.draw do
  resources :food_items do
    resources :orders
    resources :charges
  end
  get 'menu' => 'menu#index'
  get 'thank_you' => 'orders#thank_you'
  get 'contact_us' => 'welcome#contact_us'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
