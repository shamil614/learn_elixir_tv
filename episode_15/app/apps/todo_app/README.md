# TodoList

**TodoList Genserver created dynamically with Supervisor**

Start app in iex `iex -S mix`

```
# TodoApp supervisor should have started the TodoListSupervisor

iex> Process.whereis(:todo_list_supervisor)
#PID<0.129.0>

# Less typing with alias

iex> alias TodoApp.TodoListSupervisor
TodoApp.TodoListSupervisor

iex>  TodoListSupervisor.start_list(:test)
{:ok, #PID<0.133.0>}

iex> TodoList.get(:test)
%{}

iex> TodoList.add(:test, "eat breakfast")
:ok

iex> TodoList.get(:test)
%{"eat breakfast" => :not_done}

# Demonstrate that the process is restarted

iex> Process.whereis(:test)
#PID<0.133.0>

iex> Process.whereis(:test) |> Process.exit(:kill)
true

iex> Process.whereis(:test)
#PID<0.145.0>
```
