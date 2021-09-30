defmodule Exlibery.Users.User do
  @keys [:address, :name, :email, :cpf, :age]
  @enforce_keys @keys
  defstruct @keys

  def build(address, name, email, cpf, age) when age >= 18 and is_bitstring(cpf) do
    %__MODULE__{
    name: name,
    email: email,
    cpf: cpf,
    age: age,
    address: address
    }
  end

  def build(_address, _name, _email, _cpf, _age), do: { :error, "Invalid parameters"}
end