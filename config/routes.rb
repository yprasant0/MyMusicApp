Rails.application.routes.draw do
  get 'search/action'
  get 'searches', to: 'search#show_search_history'
  root 'search#action'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
