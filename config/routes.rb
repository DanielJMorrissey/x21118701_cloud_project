Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", :controller=>"homepage", :action=>"index"
  get "/bands", :controller=>"homepage", :action=>"bands"
  get "/newbands", :controller=>"homepage", :action=>"newbands"
  post "/newbands", :controller=>"homepage", :action=>"newbandscompute"
end
