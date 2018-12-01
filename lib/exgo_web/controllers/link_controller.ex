defmodule ExGoWeb.LinkController do
  use ExGoWeb, :controller

  alias ExGo.Addresses
  alias ExGo.Addresses.Link

  action_fallback ExGoWeb.FallbackController

  def index(conn, _params) do
    links = Addresses.list_links()
    render(conn, "index.json", links: links)
  end

  def create(conn, %{"link" => link_params}) do

    name = case link_params["name"] do
      true -> link_params["name"]
      _ -> ExGo.Hashcode.generate(link_params["url"])
    end

    params = Map.put_new(link_params, "name", name)

    with {:ok, %Link{} = link} <- Addresses.create_link(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.link_path(conn, :show, link))
      |> render("show.json", link: link)
    end
  end

  def show(conn, %{"id" => id}) do
    link = Addresses.get_link!(id)
    render(conn, "show.json", link: link)
  end

  def show(conn, %{"name" => name}) when is_binary(name) do
    link = Addresses.get_link_by_name!(name)
    render(conn, "show.json", link: link)
  end
end
