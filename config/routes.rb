FakeFooApi::Application.routes.draw do
  resources :foos, except: [:show]
  match '/foos/:id' => 'foos#show', :constraints => { :id => /\d.+/ }
  match '/foos/in_date_range' => 'foos#in_date_range'
  match '/foos/top_five' => 'foos#top_five'
end
