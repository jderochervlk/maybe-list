type todo = {
    text: string,
    completed: bool,
    // The timestamp of when it was created
    createdAt: int
}


@react.component
let make = (~todo) => {
    <li>{React.string(todo.text)}</li>
}