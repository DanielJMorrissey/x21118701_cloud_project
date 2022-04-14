Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # route to homepage
  get "/", :controller=>"homepage", :action=>"index"
  # route to band listing page
  get "/bands", :controller=>"homepage", :action=>"bands"
  # route to band entry form
  get "/newbands", :controller=>"homepage", :action=>"newbands"
  # post when new band/artist is submitted
  post "/newbands", :controller=>"homepage", :action=>"newbandscompute"
end
