// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("rescript/lib/js/curry.js");
var React = require("react");
var React$1 = require("@chakra-ui/react");

function CreateTodo(Props) {
  var onCreate = Props.onCreate;
  var match = React.useState(function () {
        return "";
      });
  var setValue = match[1];
  var value = match[0];
  var handleChange = function (e) {
    var t = e.target;
    Curry._1(setValue, (function (param) {
            return t.value;
          }));
  };
  return React.createElement(React$1.Box, {
              children: React.createElement("form", {
                    onSubmit: (function (e) {
                        e.preventDefault();
                        Curry._1(onCreate, value);
                        Curry._1(setValue, (function (param) {
                                return "";
                              }));
                      })
                  }, React.createElement(React$1.Grid, {
                        children: null,
                        templateColumns: "3fr 1fr",
                        gap: 4
                      }, React.createElement(React$1.Input, {
                            placeholder: "new task",
                            value: value,
                            colorScheme: "green",
                            autoFocus: true,
                            id: "new-todo",
                            onChange: handleChange
                          }), React.createElement(React$1.Button, {
                            children: "add new task",
                            colorScheme: "green",
                            type: "submit",
                            role: "submit"
                          }))),
              maxW: "800px",
              m: "3rem auto"
            });
}

var make = CreateTodo;

exports.make = make;
/* react Not a pure module */
