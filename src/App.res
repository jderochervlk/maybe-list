let todos: array<TodoItem.todo> = [
  {text: "A thing to do", completed: false, createdAt: 0, id: 1},
  {text: "More things to do", completed: false, createdAt: 0, id: 2},
]

@react.component
let make = () => {
  <div>
    <Header />
    <Todos todos />
  </div>
}
