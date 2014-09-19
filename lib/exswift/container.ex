defmodule Exswift.Container do
  @moduledoc """
  Containers handler for Exswift 
  """
  require Exswift.Auth, as: Auth

  def list Auth.access(admin_url: admin_url), container do
    response = HTTPotion.get(admin_url <> container)
    {:ok, json_response} = JSEX.decode(response)
    json_response
  end
end

