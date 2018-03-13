Rails.application.routes.draw do
  get 'feed' => 'epicenter#feed'

  get 'show_user' => 'epicenter#show_user'

  get 'now_following' => 'epicenter#now_following'

  get 'unfollow' => 'epicenter#unfollow'

  get 'tag_caws' => 'epicenter#tag_caws'

  resources :caws
  devise_for :users

  root 'epicenter#feed'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
