switch(ReactDOM.querySelector("#root")){
| Some(root) => ReactDOM.render(<div> <Header/> </div>, root)
| None => ()
}