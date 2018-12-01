# defmodule ExGo.AddressesTest do
#   use ExGo.DataCase

#   alias ExGo.Addresses

#   describe "links" do
#     alias ExGo.Addresses.Link

#     @valid_attrs %{name: "some name", url: "some url"}
#     @update_attrs %{name: "some updated name", url: "some updated url"}
#     @invalid_attrs %{name: nil, url: nil}

#     def link_fixture(attrs \\ %{}) do
#       {:ok, link} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Addresses.create_link()

#       link
#     end

#     test "list_links/0 returns all links" do
#       link = link_fixture()
#       assert Addresses.list_links() == [link]
#     end

#     test "get_link!/1 returns the link with given id" do
#       link = link_fixture()
#       assert Addresses.get_link!(link.id) == link
#     end

#     test "create_link/1 with valid data creates a link" do
#       assert {:ok, %Link{} = link} = Addresses.create_link(@valid_attrs)
#       assert link.name == "some name"
#       assert link.url == "some url"
#     end

#     test "create_link/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Addresses.create_link(@invalid_attrs)
#     end

#     test "delete_link/1 deletes the link" do
#       link = link_fixture()
#       assert {:ok, %Link{}} = Addresses.delete_link(link)
#       assert_raise Ecto.NoResultsError, fn -> Addresses.get_link_by_id!(link.id) end
#     end

#     test "change_link/1 returns a link changeset" do
#       link = link_fixture()
#       assert %Ecto.Changeset{} = Addresses.change_link(link)
#     end
#   end
# end
