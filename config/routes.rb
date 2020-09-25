Rails.application.routes.draw do
  resources :projects do
    resources :tasks do
      member do
        put :complete
      end
    end
  end
  
  root "projects#index"
end
