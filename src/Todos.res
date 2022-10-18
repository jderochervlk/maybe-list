open Belt
@react.component
let make = (~todos: option<list<TodoItem.todo>>, ~handleClick) => {
        switch todos {
        | Some(_t) =>
          <ul>
            {_t
            ->List.toArray
            ->Array.map(t => <TodoItem todo=t onClick=handleClick key={Js.String.make(t.id)} />)
            ->React.array}
          </ul>
        | _ => <div />
        }
      }