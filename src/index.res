type document // abstract type for a document object
@send external getElementById: (document, string) => Dom.element = "getElementById"
@val external doc: document = "document"

getElementById(doc, "root")->ReactDOM.Client.createRoot->ReactDOM.Client.Root.render(<App />)
