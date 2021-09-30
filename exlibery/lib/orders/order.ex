defmodule Exlibery.Orders.Order do
  @keys [:user_cpf, :delivery_address, :items, :total_price]
  @enforce_keys @keys
  defstruct @keys

  def build(user_cpf, delivery_address, items, total_price)do
    order = %__MODULE__{
      user_cpf: user_cpf,
      delivery_address: delivery_address,
      items: items,
      total_price: total_price
    }
    {:ok, order}
  end

  def build(), do: { :error, "Invalid parameters"}
end