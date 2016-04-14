# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  window.dispatcher = new WebSocketRails('0.0.0.0:3000/websocket', true)
  window.dispatcher.bind 'chat_message', (message) ->
    console.log message
  window.channel = window.dispatcher.subscribe('canal')
  window.channel.bind 'channel_message', (message) ->
    console.log 'Canal: '+message
  $('#send').click ->
    window.dispatcher.trigger('chat_message', $('#message').val())
    $('#message').val('')
