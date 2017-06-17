require_relative 'game_class'
require 'rspec'

describe "game_class" do
  let(:game) { Game.new }

  before(:each) do
    game.given_spaces("Hello World")
    game.phrase_correct
  end

  it "replaces letters with underscores" do
    expect(game.given_spaces("Hello World")).to eq "_ _ _ _ _   _ _ _ _ _ "
    expect(game.phrase_correct).to eq "h e l l o   w o r l d "
  end

  it "finds the index(es) of a given letter in the phrase" do
    expect(game.phrase_correct).to eq "h e l l o   w o r l d "
    expect(game.find_index("h")).to eq [0]
  end

  it "finds the index(es) of a given letter in the phrase" do
    expect(game.phrase_correct).to eq "h e l l o   w o r l d "
    expect(game.find_index("l")).to eq [4,6,18]
  end

  # it "replaces underscore with guessed letter" do
  #   expect(game.guess_letter("h")).to eq "h _ _ _ _   _ _ _ _ _ "
  # end

  #  it "replaces underscore with guessed letter" do
  #   expect(game.guess_letter("h")).to eq "The letter h has already been guessed."
  # end
end