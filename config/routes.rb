FakeFooApi::Application.routes.draw do
  resources :foos do
    get 'in_date_range', :on => :collection
    get 'bars', :on => :collection
  end
end
