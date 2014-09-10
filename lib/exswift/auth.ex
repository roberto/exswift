defmodule Exswift.Auth do
  @moduledoc """
  Authentication handler for Exswift 
  """
  import Record

  defrecord :access,
    token: nil

  def auth(auth_url) do
    response = HTTPotion.get(auth_url)
    {:ok, json_response} = JSEX.decode(response)
    access(token: json_response["access"]["token"]["id"])
  end

end
