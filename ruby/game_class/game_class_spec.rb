require_relative 'game_class'
require 'rspec'

describe "game_class" do
  let(:game) { Game.new }

  before(:each) do
    game.given_spaces("Hello World")
    game.phrase_correct
    game.guess_limit
  end

  it "replaces letters with underscores" do
    expect(game.given_spaces("Hello World")).to eq "_ _ _ _ _   _ _ _ _ _ "
    expect(game.phrase_correct).to eq "h e l l o   w o r l d "
  end

  it "finds the index(es) of a given letter in the phrase" do
    expect(game.find_index("h")).to eq [0]
  end

  it "finds the index(es) of a given letter in the phrase" do
    expect(game.find_index("l")).to eq [4,6,18]
  end

  it "replaces underscore with guessed letter" do
    expect(game.guess_letter("h")).to eq "h _ _ _ _   _ _ _ _ _ "
    expect(game.guess_letter("l")).to eq "h _ l l _   _ _ _ l _ "
    expect(game.guess_letter("h")).to eq "The letter h has already been guessed."
  end

  it "multiple guesses that together make the correct phrase" do
    expect(game.guess_letter("h")).to eq "h _ _ _ _   _ _ _ _ _ "
    expect(game.guess_letter("e")).to eq "h e _ _ _   _ _ _ _ _ "
    expect(game.guess_letter("l")).to eq "h e l l _   _ _ _ l _ "
    expect(game.guess_letter("o")).to eq "h e l l o   _ o _ l _ "
    expect(game.guess_letter("w")).to eq "h e l l o   w o _ l _ "
    expect(game.guess_letter("r")).to eq "h e l l o   w o r l _ "
    expect(game.guess_letter("d")).to eq "You win! Great guesses! The correct answer is: h e l l o   w o r l d ."
  end

  it "multiple guesses that go over the guess limit" do
    expect(game.guess_letter("h")).to eq "h _ _ _ _   _ _ _ _ _ "
    expect(game.guess_letter("e")).to eq "h e _ _ _   _ _ _ _ _ "
    expect(game.guess_letter("a")).to eq "h e _ _ _   _ _ _ _ _ "
    expect(game.guess_letter("b")).to eq "h e _ _ _   _ _ _ _ _ "
    expect(game.guess_letter("c")).to eq "h e _ _ _   _ _ _ _ _ "
    expect(game.guess_letter("d")).to eq "h e _ _ _   _ _ _ _ d "
    expect(game.guess_letter("f")).to eq "h e _ _ _   _ _ _ _ d "
    expect(game.guess_letter("g")).to eq "h e _ _ _   _ _ _ _ d "
    expect(game.guess_letter("i")).to eq "h e _ _ _   _ _ _ _ d "
    expect(game.guess_letter("j")).to eq "h e _ _ _   _ _ _ _ d "
    expect(game.guess_letter("k")).to eq "h e _ _ _   _ _ _ _ d "
    expect(game.guess_letter("l")).to eq "h e l l _   _ _ _ l d "
    expect(game.guess_letter("m")).to eq "h e l l _   _ _ _ l d "
    expect(game.guess_letter("n")).to eq "You used up all your guesses... Game Over!! The correct answer is: h e l l o   w o r l d ."
  end

  it "takes a phrase and see's if it's correct" do
    expect(game.guess_phrase("Hello World")).to eq "You win! Great guesses! The correct answer is: h e l l o   w o r l d ."
  end

  it "takes a phrase and see's if it's correct" do
    expect(game.guess_phrase("Jello World")).to eq "That is not the correct phrase."
  end
end