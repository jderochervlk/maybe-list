type todo = {
  text: string,
  completed: bool,
  createdAt: float,
  id: int,
}

@react.component
let make = (~todo, ~onClick) => {
  let handleClick = __ => onClick(todo)
  let class = todo.completed === false ? "" : "completed"
  <li className=class>
    <label className="container">
      {React.string(todo.text)}
      <input type_="checkbox" onClick=handleClick defaultChecked=todo.completed />
      <span className="checkmark" />
    </label>
  </li>
}
