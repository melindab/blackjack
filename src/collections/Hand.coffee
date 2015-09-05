class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    console.log('before' , @deck)
    
    @add(@deck.pop()).last()
    #console.log('after' , @deck)

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  stand: ->
  console.log(@)
  #trigger end turn event

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    
    if @minScore() + 10 * @hasAce() <= 21
       result = @minScore() + 10 * @hasAce()
    if @minScore() + 10 * @hasAce() == 21
       #trigger end turn event
       result = @minScore() + 10 * @hasAce()
    
    if @minScore() > 21
      console.log('you lose')
      #trigger you lose event
      result =  @minScore()
    result

#   ---
#on deal if 
  #we hit 21, we win the bet
  #otherwise we can keep hitting until 21 or go over 21
#on a new hit
  #we hit 21, we win
  #if over 21, we lose the bet


#if score is less than 21, use max of @scores
