class Participant
  attr_accessor :scores, :cards, :deck
  attr_reader   :account, :name

  def initialize(name)
    @name = name
    @account = Account.new.start
    @deck = CardDeck.new
  end

  def reload
    @deck = CardDeck.new
  end
end
