defmodule Servy.Wildthings do
  alias Servy.Bear

  def list_bears do
    [
      %Bear{id: 1, name: "Teddy", type: "Brown", hibernating: true},
      %Bear{id: 1, name: "Smokey", type: "Black"},
      %Bear{id: 1, name: "Paddington", type: "Brown"},
      %Bear{id: 1, name: "Scarface", type: "Grizzly", hibernating: true},
      %Bear{id: 1, name: "Snow", type: "Polar"},
      %Bear{id: 1, name: "Brutus", type: "Grizzly"},
      %Bear{id: 1, name: "Rosie", type: "Black", hibernating: true},
      %Bear{id: 1, name: "Roscoe", type: "Panda"},
      %Bear{id: 1, name: "Iceman", type: "Polar", hibernating: true},
      %Bear{id: 1, name: "Kenai", type: "Grizzly"}
    ]
  end

  def get_bear(id) when is_integer(id) do
    Enum.find(list_bears(), fn b -> b.id == id end)
  end

  def get_bear(id) when is_binary(id) do
    id |> String.to_integer() |> get_bear
  end
end
