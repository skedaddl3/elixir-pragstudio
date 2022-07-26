defmodule Servy.PledgeController do
  def create(conv, %{"name" => name, "amount" => amount}) do
    # sends pledge to the external service and caches it
    Servy.PledgeServer.create_pledge(name, String.to_integer(amount))

    %{conv | status: 201, resp_body: "#{name} pledged #{amount}!"}
  end

  def index(conv) do
    # get recent pledges from cache
    pledges = Servy.PledgeServer.recent_pledges()

    %{conv | status: 200, resp_body: inspect(pledges)}
  end
end
