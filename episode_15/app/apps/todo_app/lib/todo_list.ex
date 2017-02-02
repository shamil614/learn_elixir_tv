defmodule TodoApp.TodoList do
  @moduledoc """
  Simple Todo list application. User can create a list with todo items and mark those items as done.
  """

  use GenServer

  ## Client API

  @doc """
  Starts the Todolist Genserver
  """
  def start_link(name) do
    {:ok, _todos} = GenServer.start_link(__MODULE__, %{}, name: name)
  end

  @doc """
  Find the current Todo list by pid
  """
  def get(pid) do
    GenServer.call(pid, :get)
  end

  @doc ~S"""
  Add an item to the Todo list

  ## Examples

    iex> {:ok, todo_list} = TodoList.start_link(:foo)
    iex> TodoList.add(todo_list, "study")
    iex> TodoList.get(todo_list)
    %{"study" => :not_done}
  """
  def add(pid, todo) do
    GenServer.cast(pid, {:add, todo})
  end

  @doc """
  Completes an item to the Todo list
  """
  def complete(pid, todo) do
    GenServer.cast(pid, {:complete, todo})
  end


  ## Server Callbacks

  def init(todos) do
    {:ok, todos}
  end

  def handle_call(:get, _from, todos) do
    {:reply, todos, todos}
  end

  def handle_cast({:add, todo}, todos) do
    {:noreply, Map.put_new(todos, todo, :not_done)}
  end

  def handle_cast({:complete, todo}, todos) do
    {:noreply, %{todos | todo => :done}}
  end
end
