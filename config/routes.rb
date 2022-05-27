Rails.application.routes.draw do
  resources "posts"
  resources "sessions"
  resources "users"
  resources "comments"

  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"
end
