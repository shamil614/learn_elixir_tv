defmodule TodoApp.TodoListTest do
  use ExUnit.Case
  alias TodoApp.TodoList
  doctest TodoList

  setup do
    {:ok, todo_list} = TodoList.start_link(:testing)

    {:ok, todo_list: todo_list}
  end

  test "creates a new list", %{todo_list: todo_list} do
    assert TodoList.get(todo_list) == %{}
  end

  test "add a Todo to the list", %{todo_list: todo_list} do
    TodoList.add(todo_list, "clean house")

    assert TodoList.get(todo_list) == %{"clean house" => :not_done}
  end

  test "completes a Todo on the list", %{todo_list: todo_list} do
    TodoList.add(todo_list, "clean house")
    TodoList.complete(todo_list, "clean house")

    assert TodoList.get(todo_list) == %{"clean house" => :done}
  end

  test "multiple Todos added with different states", %{todo_list: todo_list} do
    TodoList.add(todo_list, "clean house")
    TodoList.add(todo_list, "feed dogs")

    TodoList.complete(todo_list, "clean house")

    assert TodoList.get(todo_list) == %{"clean house" => :done, "feed dogs" => :not_done}
  end
end
