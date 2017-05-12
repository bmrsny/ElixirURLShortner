defmodule Shortner.Server do
  use GenServer

  @doc "initializes the genserver, which is looping infinitely, with an empty map."
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, [])
  end
end
