open Jest
open Expect
open ReactTestingLibrary

test("displays text", () => {
  render(<Header />)->container->expect->toMatchSnapshot
})
