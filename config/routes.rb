Rails.application.routes.draw do
  resources :projects do
    member do
      post :leave_comment
    end
  end

  root "projects#show"
end
