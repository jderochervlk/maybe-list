type todo = {
  text: string,
  completed: bool,
  createdAt: int,
  id: int
}

@react.component
let make = (~todo, ~onClick) => {
  let handleClick = __ => onClick(todo)
  let class = todo.completed === true ? "" : "completed"
  <li>
    {React.string(todo.text)}
    <input className=class type_="checkbox" onClick=handleClick defaultChecked=todo.completed />
  </li>
}
