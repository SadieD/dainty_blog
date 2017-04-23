Rails.application.routes.draw do
  
  root to: 'articles#index'
  
  resources :articles do
    resources :comments   # comments nested in articles
  end
  
  resources :tags

end
