defmodule DealsWeb.Router do
  use DealsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DealsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
    
    resources "/users", UserController
    resources "/deals", DealThreadController
    resources "/posts", PostAuthorController
    resources "/comments", CommentController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DealsWeb do
  #   pipe_through :api
  # end
end
