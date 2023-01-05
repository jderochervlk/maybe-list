open Jest
open Expect
open ReactTestingLibrary

test("isEmpty when input is empty", () => {
  CreateTodo.isEmpty("")->expect->toBe(true)
})

test("isEmpty when input is not empty", () => {
  CreateTodo.isEmpty("foo")->expect->toBe(false)
})

test("Adding a todo", () => {
  let handleCreate = (_i: string) => ()
  render(<CreateTodo onCreate=handleCreate />)->container->expect->toMatchSnapshot
})
