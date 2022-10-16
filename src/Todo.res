type todo = {
  text: string,
  completed: bool,
  createdAt: int,
  id: int
}

@react.component
let make = (~todo, ~onClick) => {
  let handleClick = __ => onClick(todo)
  <li>
    {React.string(todo.text)}
    <input type_="checkbox" onClick=handleClick />
  </li>
}
