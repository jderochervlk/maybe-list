type todo = {
  text: string,
  completed: bool,
  createdAt: float,
  id: int,
}

@react.component
let make = (~todo, ~onClick) => {
  let handleClick = __ => Some(onClick(todo))
  let class = todo.completed === false ? "" : "completed"

  <Chakra.Checkbox isChecked=todo.completed onChange=handleClick size="lg" colorScheme="green">
    <p className=class> {React.string(todo.text)} </p>
  </Chakra.Checkbox>
}

let make = React.memo(make)
