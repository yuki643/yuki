Rails.application.routes.draw do
  
  get 'hotels/top_page',to: 'hotels#top_page'
  
  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
}
  
  devise_scope :user do 
   get 'users/account', to:'users/registrations#account'
  end
  
  resources :users do
    collection do
      get :profile
    end
  end
  
  resources :rooms do
    collection do
      get :search
    end
  end  
  resources :resevations do
    collection do
      post :confirm
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
