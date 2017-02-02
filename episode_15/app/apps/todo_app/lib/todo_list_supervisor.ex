defmodule TodoApp.TodoListSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: :todo_list_supervisor)
  end

  def start_list(name) do
    Supervisor.start_child(:todo_list_supervisor, [name])
  end

  def init(_) do
    children = [ worker(TodoApp.TodoList, []) ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
