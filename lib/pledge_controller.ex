defmodule Servy.PledgeController do
  alias Servy.Conv
  alias Servy.PledgeServer

  def create(%Conv{} = conv, %{"name" => name, "amount" => amount}) do
    # sends pledge to the external service and caches it
    PledgeServer.create_pledge(name, String.to_integer(amount))

    %{conv | status: 200, resp_body: "#{name} pledged #{amount}!"}
  end

  def index(%Conv{} = conv) do
    # get recent pledges from cache
    pledges = PledgeServer.recent_pledges()

    %{Conv | status: 200, resp_body: inspect(pledges)}
  end
end
