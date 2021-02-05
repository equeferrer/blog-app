Rails.application.routes.draw do
  get '/articles' => 'articles#index' 
  get '/articles/new' => 'articles#new'
	post '/articles' => 'articles#create', as: 'article_create' #ready for posting new article
  get '/search' => "articles#search"
  get '/articles/:id' => 'articles#show', as: 'article_show'
  get '/articles/edit/:id' => 'articles#edit', as: 'article_edit'
  patch '/articles/:id' => 'articles#update' , as: 'article_update'
  delete '/articles/:id' => 'articles#destroy', as: 'article_delete'
  root 'articles#new'
  # Cant have same 'get' and link but can have same /article
  # get 'articles/index'
  # get 'articles/show'
  # get 'articles/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
