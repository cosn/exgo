defmodule ExGoWeb.LinkView do
  use ExGoWeb, :view
  alias ExGoWeb.LinkView

  def render("index.json", %{links: links}) do
    %{data: render_many(links, LinkView, "link.json")}
  end

  def render("show.json", %{link: link}) do
    %{data: render_one(link, LinkView, "link.json")}
  end

  def render("link.json", %{link: link}) do
    %{id: link.id,
      name: link.name,
      url: link.url}
  end
end
