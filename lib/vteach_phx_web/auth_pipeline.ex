defmodule VteachPhxWeb.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :vteach_phx,
    module: VteachPhx.Accounts.Guardian,
    error_handler: VteachPhx.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
