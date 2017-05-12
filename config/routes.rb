Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create], shallow: true do
    resources :doses, only: [:new, :create, :destroy]
    collection do
      get 'search' => 'cocktails#search'
    end
    collection do
      post 'byingredient' => 'cocktails#byingredient'
    end
  end
  mount Attachinary::Engine => "/attachinary"
end
