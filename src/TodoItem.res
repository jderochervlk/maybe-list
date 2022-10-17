type todo = {
  text: string,
  completed: bool,
  createdAt: int,
  id: int,
}

@react.component
let make = (~todo, ~onClick) => {
  let handleClick = __ => onClick(todo)
  let class = todo.completed === false ? "" : "completed"
  <li className=class>
    <input type_="checkbox" onClick=handleClick defaultChecked=todo.completed />
    {React.string(todo.text)}
  </li>
}
