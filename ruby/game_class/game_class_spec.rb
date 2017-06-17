require_relative 'game_class'

describe 'game_class' do
  let(:game) { Game.new }

  it "replaces letters with underscores" do
    expect(game.given_spaces("Hello World")).to eq "_ _ _ _ _   _ _ _ _ _ "
  end

  it "finds the index(es) of a given letter in the phrase" do
    expect(game.find_index("l")).to eq [4,6,17]
  end

  # it "replaces underscore with guessed letter" do
  #   expect(game.guess_letter("h")).to eq "h _ _ _ _   _ _ _ _ _ "
  # end

  #  it "replaces underscore with guessed letter" do
  #   expect(game.guess_letter("h")).to eq "The letter h has already been guessed."
  # end
end