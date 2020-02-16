Rails.application.routes.draw do
  resources :tenders do
    resources :doc2s do
      member do
        get :download
      end
    end
  end
  resources :tenders do
    resources :doc1s do
        member do
          get :download
        end
    end
  end
  devise_for :users,path: '',path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'pages/home'
  root 'pages#landingpage'
  resources :tenders do 
  	member do
  		get :toggle_status
  	end
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
