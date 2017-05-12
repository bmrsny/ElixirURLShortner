defmodule Shortner.ServerTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Shortner.Server.start_link
    {:ok, pid: pid}
  end

  test "shortening a url", %{pid: pid} do
    :ok = Shortner.Server.shorten(pid, "http://apple.com", "apl")
    assert {:ok, "http://apple.com"} == Shortner.Server.url(pid, "apl")
  end

  test "finding a url that does not exist", %{pid: pid} do
    assert :error == Shortner.Server.url(pid, "apl")
  end

  test "shortening to an existing alias", %{pid: pid} do
    :ok = Shortner.Server.shorten(pid, "http://applec.com", "apl")
    assert {:error, :dupalias} = Shortner.Server.shorten(pid, "http://google.com", "apl")
  end
end
