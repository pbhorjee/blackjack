# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'winner', null

    @get 'playerHand' 
    .on 'stand', () ->
      console.log 'stand'
      @get 'dealerHand' 
      .at(0).flip()
      ## while dealerhand score <= 17
      while @get 'dealerHand' 
        .scores()[0] <= 17 
          @get 'dealerHand'
          .hit()
      if not @get 'winner'
        @findWinner()
    , @

    @get 'playerHand' 
    .on 'bust', () -> 
      console.log "dealer wins"
      @set 'winner', true
      @trigger 'win', "Dealer"
    , @

    @get 'dealerHand' 
    .on 'bust', () -> 
      console.log "player wins"
      @set 'winner', true
      @trigger 'win', "Player"
    , @

  findWinner: ->
    if @get 'playerHand' 
      .scores()[0] >= @get 'dealerHand' 
      .scores()[0]
        console.log "player wins"
        @trigger 'win', 'Player'
    else
      console.log "dealer wins"
      @trigger 'win', 'Dealer'
