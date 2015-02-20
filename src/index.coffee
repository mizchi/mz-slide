global.React = require 'react'
md2react = require 'md2react'

fs = require 'fs'
source = fs.readFileSync(__dirname+'/../slide.md').toString()

$ = React.createElement
Slide = React.createClass
  getInitialState: -> page: 0
  next: ->
    if @props.slides[@state.page + 1]
      @setState page: @state.page + 1
  prev: ->
    if @props.slides[@state.page - 1]
      @setState page: @state.page - 1

  render: ->
    $ 'div', className: 'slider-container', [
      $ 'div', className: 'slider-preview-container', [
        @props.slides[@state.page]
      ]
      $ 'div', className: 'slider-ui', [
        $ 'button', onClick: @prev, 'prev'
        $ 'button', onClick: @next, 'next'
        $ 'span', {}, "#{@state.page+1}/#{@props.slides.length}"
      ]
    ]


window.addEventListener 'DOMContentLoaded', ->
  slides = source
    .split /\-{3,}/g
    .map (s) -> md2react s
  app = React.render(React.createElement(Slide, {slides: slides}), document.body)
  window.addEventListener 'keydown', (e) ->
    if e.keyCode is 37
      app.prev()
    if e.keyCode is 39
      app.next()
