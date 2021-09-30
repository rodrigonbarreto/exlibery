defmodule Exlibery.Orders.Order do
  @keys [:user_cpf, :delivery_address, :items, :total_price]
  @enforce_keys @keys
  defstruct @keys

  alias Exlibery.Users.User
  alias Exlibery.Orders.Item

  def build(%User{cpf: cpf, address: address}, [%Item{}| _items] = items) do
    order = %__MODULE__{
      user_cpf: cpf,
      delivery_address: address,
      items: items,
      total_price: calculate_total_price(items)
    }
    {:ok, order}
  end

  def build(_user, _items), do: { :error, "Invalid parameters"}

  defp calculate_total_price(items) do
    Enum.reduce(items,Decimal.new("0.00"), &sum_prices(&1,&2))
  end

  defp sum_prices(%Item{unity_price: price, quantity: quantity}, acc) do
    price
    |> Decimal.mult(quantity)
    |> Decimal.add(acc)
  end
end