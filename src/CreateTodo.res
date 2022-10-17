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
    <input id="new-todo" onChange=handleChange value/>
    <button role="submit"> {React.string("add")} </button>
  </form>
}
