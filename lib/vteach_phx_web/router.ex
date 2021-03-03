defmodule VteachPhxWeb.Router do
  use VteachPhxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authentication do
    plug VteachPhxWeb.AuthPipeline
  end

  scope "/api", VteachPhxWeb do
    pipe_through :api

    post "/auth/signin", AuthController, :sign_in
    # post "/users/create", UserController, :create
  end

  scope "/api", VteachPhxWeb do
    # pipe_through :api
    pipe_through [:api, :jwt_authentication]

    # resources "/users", UserController, except: [:new, :edit]
    get "/users/index", UserController, :index
    get "/users/:id", UserController, :show
    post "/users/create", UserController, :create
    put "/users/update/:id", UserController, :update
    delete "/users/delete/:id", UserController, :delete

    # resources "/institutes", InstituteController, except: [:new, :edit]
    get "/institutes/index", InstituteController, :index
    get "/institutes/my_institues", InstituteController, :my_institues
    get "/institutes/:id", InstituteController, :show
    post "/institutes/create", InstituteController, :create
    put "/institutes/update/:id", InstituteController, :update
    delete "/institutes/delete/:id", InstituteController, :delete

    # resources "/user_institute", UserInstituteController, except: [:new, :edit]
    get "/user_institute/index", UserInstituteController, :index
    get "/user_institute/:id", UserInstituteController, :show
    post "/user_institute/create", UserInstituteController, :create
    put "/user_institute/update/:id", UserInstituteController, :update
    delete "/user_institute/delete/:id", UserInstituteController, :delete
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: VteachPhxWeb.Telemetry
    end
  end
end
