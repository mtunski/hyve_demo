defmodule HyveDemoWeb.PageController do
  use HyveDemoWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
