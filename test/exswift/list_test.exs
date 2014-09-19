defmodule Exswift.ContainerTest do
  use ExUnit.Case, async: false
  import Mock
  require Record
  require Exswift.Auth
  require Exswift.Container
  alias Exswift.Auth, as: Auth
  alias Exswift.Container, as: Container

  @admin_url "http://api-url-com/"
  @access Auth.access(token: "token-id", admin_url: @admin_url, public_url: "http://public-url-com/")
  @list_response "[{\"name\": \"file1\"},{\"name\":\"file2\"}]"

  test_with_mock "list requests using admin url and container name", HTTPotion, [get: fn(_url) -> @list_response end] do
    Container.list @access, "my-container"
    assert called HTTPotion.get(@admin_url <> "my-container")
  end

  test_with_mock "returns parsed json", HTTPotion, [get: fn(_url) -> @list_response end] do
    data = Container.list @access, "my-container"
    assert data == [%{"name" => "file1"}, %{"name" => "file2"}]
  end

end
