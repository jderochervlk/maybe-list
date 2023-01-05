@react.component
let make = () =>
  <React.Fragment>
    <h1 className="header"> {React.string("Maybe List")} </h1>
    <p>
      {React.string("A todo app that deletes items if they haven't been completed in 24 hours.")}
    </p>
  </React.Fragment>
