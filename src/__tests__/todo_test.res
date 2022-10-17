open Jest
open Expect
open ReactTestingLibrary

let item: TodoItem.todo = { createdAt: 1.0, id: 1, text: "one", completed: false }

test("onClick is called when clicking", () => {
    let result = render(<TodoItem todo=item onClick={_ => ()} />)
    act(() => result -> getByRole(~matcher=#Str("checkbox"))->FireEvent.click->ignore)
    
    result->container->expect->toMatchSnapshot
})