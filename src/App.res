let todos: array<TodoItem.todo> = [
  {text: "A thing to do", completed: false, createdAt: 1.0, id: 1},
  {text: "More things to do", completed: false, createdAt: 2.0, id: 2},
]

@react.component
let make = () => {
  let t = React.useMemo(() => {
    Dom.Storage.getItem("todos", Dom_storage.localStorage)
  })

  // TODO: convert local storage string into array of objects
  // parse and stuff

  Js.log(t)

  <div>
    <Header />
    <Todos todos />
  </div>
}
