defmodule TodoList do
  use GenServer

  ## Client API

  @doc """
  Starts the Todolist Genserver
  """
  def start_link do
    {:ok, todos} = GenServer.start_link(__MODULE__, :ok, [])
  end

  @doc """
  Find the current Todo list by pid
  """
  def get(pid) do
    GenServer.call(pid, :get)
  end

  @doc """
  Add an item to the Todo list
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

  def init(:ok) do
    {:ok, %{}}
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
