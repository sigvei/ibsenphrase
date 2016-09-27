require "spec_helper"

describe Ibsenphrase::Wordlist do
  subject { Ibsenphrase::Wordlist.new('test') }

  it "loads a list" do
    expect(subject.num_words).to eq(3)
  end

  it "picks words at random" do
    expect(['just', 'three', 'words'].include?(subject.draw_word)).to be_truthy
  end
end
