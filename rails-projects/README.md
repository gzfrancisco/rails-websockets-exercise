rails-websockets-exercise
=========================

Exercises in ruby on rails for web sockets whit puma and thin.

Here are two folders whit one project each. The two projects work with rubinius.

#ruby-websockets-chat-demo

Project with Sinatra based app for non-event machine web server like puma.
This project has a middleware to respond the calls from websocket object in javascript.

The project has some dependencies.

#WbSckt

Project with Rails based app for event-machine web server like thin or unicorn.

This project has a event map with websocket-rails gem. The calls from javascript has websocketrails objects.

The project has rails and websocket-rails dependency.

#About

**Author:** Francisco Granados

**twitter:**  @gzfrancisco