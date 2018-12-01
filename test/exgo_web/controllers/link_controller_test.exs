defmodule ExGoWeb.LinkControllerTest do
  use ExGoWeb.ConnCase

  @full_link %{
    name: "foobar",
    url: "http://foobar.com"
  }

  @partial_link %{
    url: "http://foobar.com"
  }

  @hashcode "122f03d"

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create link" do
    test "link with name and url", %{conn: conn} do
      conn = post(conn, Routes.link_path(conn, :create), link: @full_link)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.link_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "foobar",
               "url" => "http://foobar.com"
             } = json_response(conn, 200)["data"]
    end

    test "link only with url", %{conn: conn} do
      conn = post(conn, Routes.link_path(conn, :create), link: @partial_link)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.link_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => @hashcode,
               "url" => "http://foobar.com"
             } = json_response(conn, 200)["data"]
    end

    # test "renders errors when data is invalid", %{conn: conn} do
    #   conn = post(conn, Routes.link_path(conn, :create), link: @invalid_attrs)
    #   assert json_response(conn, 422)["errors"] != %{}
    # end
  end

  # describe "update link" do
  #   setup [:create_link]

  #   test "renders link when data is valid", %{conn: conn, link: %Link{id: id} = link} do
  #     conn = put(conn, Routes.link_path(conn, :update, link), link: @update_attrs)
  #     assert %{"id" => ^id} = json_response(conn, 200)["data"]

  #     conn = get(conn, Routes.link_path(conn, :show, id))

  #     assert %{
  #              "id" => id,
  #              "name" => "some updated name",
  #              "url" => "some updated url"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn, link: link} do
  #     conn = put(conn, Routes.link_path(conn, :update, link), link: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  # describe "delete link" do
  #   setup [:create_link]

  #   test "deletes chosen link", %{conn: conn, link: link} do
  #     conn = delete(conn, Routes.link_path(conn, :delete, link))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.link_path(conn, :show, link))
  #     end
  #   end
  # end
end
