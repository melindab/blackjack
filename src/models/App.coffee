# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand' , => @get('dealerHand').models[0].flip()
    # logic for how dealer plays moves
                                      
    @get('dealerHand').on 'stand', => console.log 'dealerhand working'
  events: -> 'stand' : 
    console.log 'it works'
