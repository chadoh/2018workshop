defmodule GreetEveryone do
  @moduledoc """
  Provides a function `hello/1` to greet a human
  """

  @doc """
  Prints a hello message

  ## Parameters

    - name: String that represents the name of the person.

  ## Examples

      iex> GreetEveryone.hello("Sean")
      "Hello, Sean"

      iex> GreetEveryone.hello("pete")
      "Hello, pete"

  """
  @spec hello(String.t()) :: String.t()
  def hello(name) do
    "Hello, " <> name
  end
end
