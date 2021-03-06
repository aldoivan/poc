Canvas = can.Construct.extend
	_WIDTH  : 800
	_HEIGHT : 500
,
	init : ( id ) ->
		Selection = require 'core/selection'

		@draw            = SVG("#{id}").size Canvas._WIDTH, Canvas._HEIGHT
		@elements        = {}
		@current_element = null
		@initialBox      = null

		@selection = new Selection @

		@_addListeners()

	_addListeners : ->
		$("#canvas").on "click", (event) =>
			@clearSelection()

	clearSelection : ->
		@selection.clear()
		@current_element = null
		$(app).trigger "selectionCleared"

	clear : ->
		@draw.clear()
		@elements        = {}
		@current_element = null
		@initialBox      = null
		@selection.createWrapper()

	select : (element) ->
		@current_element = element
		@selection.update element
		
		$(app).trigger 
			type : "elementSelected"

module.exports = Canvas