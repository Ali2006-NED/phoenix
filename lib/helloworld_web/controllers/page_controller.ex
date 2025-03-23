defmodule HelloworldWeb.PageController do
  use HelloworldWeb, :controller

  plug :redirect_if_not_logged_in when action in [:home]

  def home(conn, _params) do
    render(conn, "home.html")
  end

  defp redirect_if_not_logged_in(conn, _params) do
    if conn.assigns[:current_user] do
      conn  # Allow access if user is logged in
    else
      conn
      |> redirect(to: "/users/log_in")  # Redirect to login if not logged in
      |> halt()
    end
  end
end
