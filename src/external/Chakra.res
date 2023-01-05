module ChakraProvider = {
  @react.component @module("@chakra-ui/react")
  external make: (~children: React.element) => React.element = "ChakraProvider"
}

module Box = {
  @react.component @module("@chakra-ui/react")
  external make: (
    ~children: React.element,
    ~w: option<string>=?,
    ~maxW: option<string>=?,
    ~h: option<string>=?,
    ~m: option<string>=?,
  ) => React.element = "Box"
}

module Text = {
  @react.component @module("@chakra-ui/react")
  external make: (
    ~children: React.element,
    ~textAlign: option<string>=?,
    ~fontFamily: option<string>=?,
    ~fontSize: option<string>=?,
    ~pt: option<int>=?,
  ) => React.element = "Text"
}

module Input = {
  @react.component @module("@chakra-ui/react")
  external make: (
    ~placeholder: option<string>=?,
    ~value: option<string>=?,
    ~colorScheme: option<string>=?,
    ~autoFocus: option<bool>=?,
    ~id: option<string>=?,
    ~onChange: option<ReactEvent.Form.t => unit>=?,
  ) => React.element = "Input"
}

module Button = {
  @react.component @module("@chakra-ui/react")
  external make: (
    ~children: React.element,
    ~colorScheme: option<string>=?,
    ~id: option<string>=?,
    ~mt: option<string>=?,
    ~\"type": option<string>=?,
    ~role: option<string>=?,
  ) => React.element = "Button"
}

module FormControl = {
  @react.component @module("@chakra-ui/react")
  external make: (~children: React.element) => React.element = "FormControl"
}

module Grid = {
  @react.component @module("@chakra-ui/react")
  external make: (
    ~children: React.element,
    ~templateColumns: option<string>=?,
    ~gap: option<int>=?,
  ) => React.element = "Grid"
}

module GridItem = {
  @react.component @module("@chakra-ui/react")
  external make: (~children: React.element) => React.element = "GridItem"
}

module Checkbox = {
  @react.component @module("@chakra-ui/react")
  external make: (
    ~\"type": option<string>=?,
    ~children: option<React.element>=?,
    ~colorScheme: option<string>=?,
    ~id: option<string>=?,
    ~isChecked: option<bool>=?,
    ~onChange: option<'a => option<unit>>=?,
    ~onClick: option<'a => option<unit>>=?,
    ~role: option<string>=?,
    ~size: option<string>=?,
  ) => React.element = "Checkbox"
}

module VStack = {
  @react.component @module("@chakra-ui/react")
  external make: (~children: React.element, ~align: option<string>=?) => React.element = "VStack"
}
module HStack = {
  @react.component @module("@chakra-ui/react")
  external make: (~children: React.element, ~align: option<string>=?) => React.element = "HStack"
}
