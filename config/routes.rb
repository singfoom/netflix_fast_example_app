Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'books/slow', :to => 'books#slow_index', :format => 'json'
  get 'books/slow_show/:id', :to => 'books#slow_show', :format => 'json'
  resources :books, :only => [:index, :show, :create], :format => 'json'

end
