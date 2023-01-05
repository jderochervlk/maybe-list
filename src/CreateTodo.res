let isEmpty = t => t == ""

@react.component
let make = (~onCreate) => {
  let (value, setValue) = React.useState(_ => "")

  let handleChange = e => {
    let t = ReactEvent.Form.target(e)
    setValue(_ => t["value"])
  }
  <Chakra.Box maxW="800px" m="3rem auto">
    <form
      onSubmit={e => {
        ReactEvent.Form.preventDefault(e)
        onCreate(value)
        setValue(_ => "")
      }}>
      <Chakra.Grid templateColumns="1fr auto" gap=4>
        <Chakra.Input
          colorScheme="green"
          id="new-todo"
          onChange=handleChange
          value
          autoFocus=true
          placeholder="enter task name"
        />
        <Chakra.Button \"type"="submit" colorScheme="green" isDisabled={isEmpty(value)}>
          {React.string("add new task")}
        </Chakra.Button>
      </Chakra.Grid>
    </form>
  </Chakra.Box>
}
