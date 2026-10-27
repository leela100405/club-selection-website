Rails.application.routes.draw do
  root "registrations#new"
  resources :registrations, only: [:new, :create, :show]
  get "/admin", to: "admin#index", as: :admin
  get "/admin/export.csv", to: "admin#export", as: :admin_export
end
