@react.component
let make = () =>
  <Chakra.Box maxW="500px" m="auto">
    <Chakra.Text textAlign="center" fontSize="5xl"> {React.string("Maybe List")} </Chakra.Text>
    <Chakra.Text pt={10}>
      {React.string("A todo app that deletes items if they haven't been completed in 24 hours.")}
    </Chakra.Text>
  </Chakra.Box>
