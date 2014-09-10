defmodule Exswift.AuthTest do
  use ExUnit.Case, async: false
  import Mock
  require Record
  require Exswift.Auth
  alias Exswift.Auth, as: Auth

  @auth_url "http://swift.ex/auth"

  def auth_response do
    File.open! "test/fixtures/auth_response.json", fn(pid) ->
      IO.read(pid, :all)
    end
  end

  test_with_mock "requests auth url", HTTPotion, [get: fn(_url) -> auth_response end] do
    Auth.auth(@auth_url)
    assert called HTTPotion.get(@auth_url)
  end

  test_with_mock "connect returns an access record", HTTPotion, [get: fn(_url) -> auth_response end] do
    Auth.auth(@auth_url)
    assert Record.is_record(Auth.auth(@auth_url), :access)
  end

  test_with_mock "connect returns access with token", HTTPotion, [get: fn(_url) -> auth_response end] do
    access = Auth.auth(@auth_url)
    assert "token-id" = Auth.access(access, :token)
  end
end
