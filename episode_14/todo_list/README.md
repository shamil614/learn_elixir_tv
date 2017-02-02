# TodoList

**TodoList GenServer to hold state of todolists**

Start app in iex `iex -S mix`

```
iex> {:ok, pid} = TodoList.start_link
{:ok, #PID<0.121.0>}

iex> TodoList.add(pid, "clean")
:ok

iex> TodoList.get(pid)
%{"clean" => :not_done}

iex> TodoList.complete(pid, "clean")
:ok

iex> TodoList.get(pid)
%{"clean" => :done}
```
