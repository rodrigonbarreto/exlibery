defmodule Exlibery do
  alias Exlibery.Orders.Agent, as: OrderAgent
  alias Exlibery.Orders.CreateOrUpdate, as: CreateOrUpdateOrders
  alias Exlibery.Users.Agent, as: UserAgent
  alias Exlibery.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrders, as: :call
end
