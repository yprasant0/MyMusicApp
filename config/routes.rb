Rails.application.routes.draw do
  get 'history/show_search_history'
  get 'search/action'
  get 'searches', to: 'history#show_search_history'
  root 'search#action'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
