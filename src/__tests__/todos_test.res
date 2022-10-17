open Todos
open TodoItem
open Jest
open Expect
open ReactTestingLibrary

let todos: array<todo> = [
  {id: 1, text: "one", createdAt: 1, completed: false},
  {id: 2, text: "two", createdAt: 2, completed: false},
]

test("toggle todo", () => {
  let results = toggleTodo(
    [
      {id: 1, text: "one", createdAt: 1, completed: false},
      {id: 2, text: "two", createdAt: 2, completed: false},
    ],
    {id: 1, text: "one", createdAt: 1, completed: false},
  )
  results
  ->expect
  ->toEqual([
    {id: 2, text: "two", createdAt: 2, completed: false},
    {id: 1, text: "one", createdAt: 1, completed: true},
  ])
})

test("renders", () => {
  let result = render(<Todos todos />)
  result->container->expect->toMatchSnapshot
})

test("updates on click", () => {
    let result = render(<Todos todos=[todos[0]] />)
      act(() => result -> getByRole(~matcher=#Str("checkbox"))->FireEvent.click->ignore)
      result->container->expect->toMatchSnapshot
})
