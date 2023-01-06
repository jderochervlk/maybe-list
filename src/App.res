open Belt

@scope("JSON") @val
external parseIntoTodos: string => array<TodoItem.todo> = "parse"

let theme = Chakra.extendTheme(
  ~theme={
    "styles": {
      "global": {
        "html, body": {
          "fontFamily": "Playfair Display",
        },
      },
    },
  },
)

@react.component
let make = () => {
  let todos = React.useMemo(() => {
    Dom.Storage.getItem("todos", Dom_storage.localStorage)->Option.map(parseIntoTodos)
  })
  <Chakra.ChakraProvider theme>
    <Header />
    <Todos todos />
  </Chakra.ChakraProvider>
}
