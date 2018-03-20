Rails.application.routes.draw do

  resources :functions
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => "/sidekiq"

  root to: "pages#homepage"

  get "/sales" => "sales#index", as: "sales_index"
  get "/sales/report" => "sales#report", as: "sales_report"

end
