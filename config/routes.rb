Rails.application.routes.draw do
  Rails.application.routes.draw do
    resources :artists, only: [:index, :new, :create, :show, :edit, :update]
  end
end
