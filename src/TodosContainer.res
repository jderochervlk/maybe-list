open TodoItem
open Belt

let initTodos = (todos: option<list<todo>>) =>
  switch todos {
  | Some(t) => t
  | None => list{}
  }

let sortTodos = (t: list<todo>) => {
  let notComplete = t->List.keep(x => !x.completed)
  let complete = t->List.keep(x => x.completed)
  list{notComplete, complete}
}

@react.component
let make = (~todos: option<list<todo>>) => {
  // TODO: split out completed TODOs from incomplete TODOs
  let (items, setItems) = React.useState(_ => todos->initTodos)

  let (incomplete, setIncomplete) = React.useState(_ => todos->initTodos->sortTodos->List.head)
  let (complete, setComplete) = React.useState(_ => todos->initTodos->sortTodos->List.get(1))

  let handleCreate = e => {
    let time = Js.Date.now()
    let newTodo = {
      text: e,
      createdAt: time,
      completed: false,
      id: 0,
    }
    setItems(x => x->List.add(newTodo))
  }

  let handleClick = e => {
    let updatedTodo = {...e, completed: !e.completed}
    setItems(_items => _items->List.keep(x => x.id !== e.id)->List.add(updatedTodo))
    setIncomplete(_ => todos->initTodos->sortTodos->List.head)
  }

  React.useEffect1(() => {
    items
    ->List.toArray
    ->Js.Json.stringifyAny
    ->Option.forEach(x => Dom.Storage.setItem("todos", x, Dom_storage.localStorage))
    None
  }, [items])

  <div>
    <CreateTodo onCreate=handleCreate />
    <Todos todos=incomplete handleClick />
    <h2> {React.string("completed")} </h2>
    <Todos todos=complete handleClick />
  </div>
}
