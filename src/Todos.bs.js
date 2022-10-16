// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Todo = require("./Todo.bs.js");
var Curry = require("rescript/lib/js/curry.js");
var React = require("react");
var Belt_Array = require("rescript/lib/js/belt_Array.js");

function Todos(Props) {
  var todos = Props.todos;
  var match = React.useState(function () {
        return todos;
      });
  var setItems = match[1];
  var handleClick = React.useCallback(function (e) {
        var updatedTodo_text = e.text;
        var updatedTodo_completed = !e.completed;
        var updatedTodo_createdAt = e.createdAt;
        var updatedTodo_id = e.id;
        var updatedTodo = {
          text: updatedTodo_text,
          completed: updatedTodo_completed,
          createdAt: updatedTodo_createdAt,
          id: updatedTodo_id
        };
        Curry._1(setItems, (function (_items) {
                return Belt_Array.concat(Belt_Array.keep(_items, (function (x) {
                                  return x.id !== e.id;
                                })), [updatedTodo]);
              }));
      });
  return React.createElement("ul", undefined, Belt_Array.map(match[0], (function (t) {
                    return React.createElement(Todo.make, {
                                todo: t,
                                onClick: handleClick
                              });
                  })));
}

var make = Todos;

exports.make = make;
/* Todo Not a pure module */
