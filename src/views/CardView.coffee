class window.CardView extends Backbone.View
  className: 'card'
  # rankName: model.rankName.toLowerCase()
  # suitName: model.suitName.toLowerCase()

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" />'
  #'<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template {rankName: String(@model.get('rankName'))
      .toLowerCase(), suitName: @model.get('suitName').toLowerCase()}
    #@$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

  