Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'books/slow', :to => 'books#slow_index'
  get 'books/slow_show/:id', :to => 'books#slow_show'
  resources :books, :only => [:index, :show]

end
