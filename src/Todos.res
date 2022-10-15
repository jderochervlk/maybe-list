open Todo
open Belt

@react.component
let make = (~todos: array<todo>) =>
  <ul> {todos->Array.map(t => <Todo todo=t/>)->React.array} </ul>

