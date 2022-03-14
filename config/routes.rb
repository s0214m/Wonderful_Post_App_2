Rails.application.routes.draw do
  get 'articles' => 'articles#search'
  get 'mypage' => 'mypage#index'
  get 'mypages' => 'mypage#search'
  devise_for :users, controllers: {sessions: 'users/sessions'}
  root :to => 'articles#index'
  resources :articles
  resources :sample_articles
end
