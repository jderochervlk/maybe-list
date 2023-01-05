open TodoItem

let initTodos = (todos: option<array<todo>>) =>
  switch todos {
  | Some(t) => t
  | None => []
  }

let sort = t => {
  let t2 = t
  t2->Js.Array2.sortInPlaceWith((t3, _) => t3.completed ? 1 : -1)
}

let nextId = t => {
  let _t = t
  let id = _t->Js.Array2.sortInPlaceWith((x1, x2) => x1.id < x2.id ? 1 : -1)->Belt.Array.get(0)
  switch id {
  | Some(ix) => ix.id + 1
  | None => 0
  }
}

@react.component
let make = (~todos: option<array<todo>>) => {
  let (items: array<TodoItem.todo>, setItems) = React.useState(_ => todos->initTodos)

  let handleClick = e => {
    setItems(_items =>
      _items
      ->Js.Array2.filter(t => t.id != e.id)
      ->Js.Array2.concat([{...e, completed: !e.completed}])
      ->sort
    )
  }

  let handleCreate = e => {
    let newTodo = {
      text: e,
      createdAt: Js.Date.now(),
      completed: false,
      id: nextId(items),
    }
    setItems(x => x->Js.Array2.concat([newTodo])->sort)
  }

  React.useEffect1(() => {
    setItems(t =>
      t->Js.Array2.filter(x => DateFns.differenceInHours(x.createdAt, Js.Date.now()) < 24.00)
    )
    None
  }, [])

  React.useEffect1(() => {
    let string = items->Js.Json.stringifyAny
    string->Belt.Option.forEach(x => Dom.Storage.setItem("todos", x, Dom_storage.localStorage))
    None
  }, [items])

  <div>
    <CreateTodo onCreate=handleCreate />
    <ul>
      {items
      ->Js.Array2.map(t => <TodoItem todo=t onClick=handleClick key={Js.String.make(t.text)} />)
      ->React.array}
    </ul>
  </div>
}
