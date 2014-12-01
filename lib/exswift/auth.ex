defmodule Exswift.Auth do
  @moduledoc """
  Authentication handler for Exswift 
  """
  import Record

  defrecord :access,
    token: nil,
    public_url: nil,
    admin_url: nil

  def auth auth_url do
    response = HTTPotion.get(auth_url)
    {:ok, json_response} = JSX.decode(response)
    extract_data(json_response["access"])
  end

  defp extract_data json do
    endpoints = extract_endpoints json
    token = json["token"]["id"]

    access( token: token,
            public_url: endpoints[:public_url],
            admin_url: endpoints[:admin_url])
  end

  defp extract_endpoints json do
    catalog = extract_storage_catalog json
    endpoints = catalog["endpoints"] |> List.first

    %{public_url: endpoints["publicURL"], admin_url: endpoints["adminURL"]}
  end

  defp extract_storage_catalog json do
    Enum.find json["serviceCatalog"], fn(catalog) ->
      catalog["type"] == "object-store"
    end
  end

end
