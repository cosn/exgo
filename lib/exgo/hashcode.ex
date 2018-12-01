defmodule ExGo.Hashcode do

  @spec generate(any) :: String.t
  def generate(string) do
    UUID.uuid5(:url, string, :hex)
      |> :erlang.phash2
      |> Integer.to_string(16)
      |> String.downcase
  end
end
