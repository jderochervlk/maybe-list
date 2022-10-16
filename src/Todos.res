open Todo
open Belt

@react.component
let make = (~todos: array<todo>) => {
  let (items, setItems) = React.useState(_ => todos)

  let handleClick = React.useCallback(e => {
    let updatedTodo = {...e, completed: !e.completed}
    setItems(_items => _items->Array.keep(x => x.id !== e.id)->Array.concat([updatedTodo]))
  })

  <ul> {items->Array.map(t => <Todo todo=t onClick=handleClick />)->React.array} </ul>
}
