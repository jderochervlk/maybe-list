open TodoItem
open Jest
open Expect
open ReactTestingLibrary
open Belt
let todos: list<todo> = list{
  {id: 1, text: "one", createdAt: 1.0, completed: false},
  {id: 2, text: "two", createdAt: 2.0, completed: true},
}

test("renders", () => {
  let result = render(<TodosContainer todos=Some(todos) />)
  result->container->expect->toMatchSnapshot
})

test("updates on click", () => {
  let result = render(
    <TodosContainer todos=Some(list{{id: 1, text: "one", createdAt: 1.0, completed: false}}) />,
  )
  act(() => result->getByRole(~matcher=#Str("checkbox"))->FireEvent.click->ignore)
  result->container->expect->toMatchSnapshot
})

test("initTodos handles empty todos", () => {
  None->TodosContainer.initTodos->expect->toEqual(list{})
})

test("initTodos handles existing todos", () => {
  Some(todos)->TodosContainer.initTodos->expect->toEqual(todos)
})

test("sortTodos returns not complete todos as head", () => {
  todos
  ->TodosContainer.sortTodos
  ->List.head
  ->expect
  ->toEqual(Some(list{{id: 1, text: "one", createdAt: 1.0, completed: false}}))
})

test("sortTodos returns complete todos as tail", () => {
  todos
  ->TodosContainer.sortTodos
  ->List.get(1)
  ->expect
  ->toEqual(Some(list{{id: 2, text: "two", createdAt: 2.0, completed: true}}))
})
