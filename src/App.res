open Belt

@scope("JSON") @val
external parseIntoTodos: string => array<TodoItem.todo> = "parse"

@react.component
let make = () => {
  let todos = React.useMemo(() => {
    Dom.Storage.getItem("todos", Dom_storage.localStorage)
    ->Option.map(parseIntoTodos)
  })

  <div>
    <Header />
    <Todos todos />
  </div>
}
