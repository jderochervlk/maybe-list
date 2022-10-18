open Todos
open TodoItem
open Jest
open Expect
open ReactTestingLibrary
open Belt

let todos: list<todo> = list{
  {id: 1, text: "one", createdAt: 1.0, completed: false},
  {id: 2, text: "two", createdAt: 2.0, completed: false},
}


test("renders", () => {
  let result = render(<Todos todos=Some(todos) />)
  result->container->expect->toMatchSnapshot
})

test("updates on click", () => {
    let result = render(<Todos todos=Some(list{{id: 1, text: "one", createdAt: 1.0, completed: false}}) />)
      act(() => result -> getByRole(~matcher=#Str("checkbox"))->FireEvent.click->ignore)
      result->container->expect->toMatchSnapshot
})
