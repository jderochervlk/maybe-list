open TodoItem
open Belt

let toggleTodo = (todos: array<todo>, todo) => {
  let updatedTodo = {...todo, completed: !todo.completed}
  todos->Array.keep(x => x.id !== todo.id)->Array.concat([updatedTodo])
}

@react.component
let make = (~todos: array<todo>) => {
  // TODO: split out completed TODOs from incomplete TODOs
  let (items, setItems) = React.useState(_ => todos->List.fromArray)

  let handleClick = e => {
    let updatedTodo = {...e, completed: !e.completed}
    setItems(_items =>
      _items
      ->List.keep(x => x.id !== e.id)
      ->List.add(updatedTodo)
      ->List.sort((a, _b) => a.completed === true ? 1 : -1)
    )
  }

  let handleCreate = e => {
    let time = Js.Date.now()
    let newTodo = {
      text: e,
      createdAt: time,
      completed: false,
      id: 0,
    }
    setItems(x => x->List.add(newTodo))
    let string = items->List.toArray->Js.Json.stringifyAny
    string->Option.forEach(x => Dom.Storage.setItem("todos", x, Dom_storage.localStorage))

    let x = Dom.Storage.getItem("todos", Dom_storage.localStorage)
    Js.log(x)
  }

  <div>
    <CreateTodo onCreate=handleCreate />
    <ul>
      {items
      ->List.toArray
      ->Array.map(t => <TodoItem todo=t onClick=handleClick key={Js.String.make(t.id)} />)
      ->React.array}
    </ul>
  </div>
}
