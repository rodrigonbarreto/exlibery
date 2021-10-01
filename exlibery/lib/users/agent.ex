defmodule Exlibery.Users.Agent do
  alias Exlibery.Users.User

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{}  end, name: __MODULE__)
  end

  def get(cpf), do: Agent.get(__MODULE__, &get_user(&1, cpf))

  def list_all do
    Agent.get(__MODULE__, &(&1))
  end

  defp get_user(state, cpf) do
    case Map.get(state, cpf) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, user))

  defp update_state(state, %User{cpf: cpf} = user), do: Map.put(state, cpf, user)
end