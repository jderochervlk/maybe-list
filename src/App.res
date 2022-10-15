let todos: array<Todo.todo> = [{text: "A thing to do", completed: false, createdAt: 0}]

@react.component
let make = () => {
  <div>
    <Header />
    <Todos todos />
  </div>
}
