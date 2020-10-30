Rails.application.routes.draw do
  resources :articles do
    collection do
      post :confirm
    end
  end
end
