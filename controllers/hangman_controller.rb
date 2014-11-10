class HangmanController < ApplicationController

  get '/' do
    # authenticate!
    api_response = HTTParty.get("http://www.colourlovers.com/api/palettes/random")
    @title = api_response['palettes']['palette']['title']
    @hex = api_response['palettes']['palette']['colors']['hex']
    # @word = "lemur"
    erb :hangman
  end

  patch '/:id' do
    content_type :json
    game = Hangman.find(params[:id])
    guess = params[:guess].downcase
    game.guess_letter(guess);
    {
      id: game.id,
      game_state: game.game_state,
      bad_guesses: game.bad_guesses,
      complete: game.game_state == game.random_word
    }.to_json
  end

  post '/' do
    content_type :json
    word = File.read('./lib/words.txt').split("\n").sample
    game_state = word.gsub(/\w/i, '_')
    game = Hangman.create({random_word: word, game_state: game_state})
    {
      id: game.id,
      game_state: game.game_state
    }.to_json
  end
end