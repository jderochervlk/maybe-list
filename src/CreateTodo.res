@react.component
let make = (~onCreate) => {
  let (value, setValue) = React.useState(_ => "")

  let handleChange = e => {
    let t = ReactEvent.Form.target(e)
    setValue(_ => t["value"])
  }

  <form
    onSubmit={e => {
      ReactEvent.Form.preventDefault(e)
      onCreate(value)
      setValue(_ => "")
    }}>
    <div className="new-todo">
      <input id="new-todo" onChange=handleChange value autoFocus=true placeholder="new task" />
      <button role="submit"> {React.string("add new task")} </button>
    </div>
  </form>
}
