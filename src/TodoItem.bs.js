// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("rescript/lib/js/curry.js");
var React = require("react");

function TodoItem(Props) {
  var todo = Props.todo;
  var onClick = Props.onClick;
  var handleClick = function (__) {
    Curry._1(onClick, todo);
  };
  var $$class = todo.completed === false ? "" : "completed";
  return React.createElement("li", {
              className: $$class
            }, React.createElement("input", {
                  defaultChecked: todo.completed,
                  type: "checkbox",
                  onClick: handleClick
                }));
}

var make = TodoItem;

exports.make = make;
/* react Not a pure module */
