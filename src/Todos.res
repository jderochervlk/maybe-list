open TodoItem
open Belt

let toggleTodo = (todos: array<todo>, todo) => {
  let updatedTodo = {...todo, completed: !todo.completed}
  todos->Array.keep(x => x.id !== todo.id)->Array.concat([updatedTodo])
}

@react.component
let make = (~todos: array<todo>) => {
  let (items, setItems) = React.useState(_ => todos)

  let handleClick = e => {
    let updatedTodo = {...e, completed: !e.completed}
    setItems(_items => _items->Array.keep(x => x.id !== e.id)->Array.concat([updatedTodo]))
  }

  <ul> {items->Array.map(t => <TodoItem todo=t onClick=handleClick key=Js.String.make(t.id) />)->React.array} </ul>
}
