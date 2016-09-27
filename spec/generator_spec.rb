require "spec_helper"

describe Ibsenphrase::Generator do
  before do
    # We are not testing wordlist here, so we make a fake that returns
    # 'randomword' all the time

    @wordlist = double('wordlist')
    allow(@wordlist).to receive(:draw_word).and_return('randomword')
    allow(Ibsenphrase::Wordlist).to receive(:new).and_return(@wordlist)
  end

  context "with separation=:space" do
    subject { Ibsenphrase::Generator.new(separation: :space) }

    it "returns spaced passphrases" do
      expect(subject.passphrase(2)).to eq('randomword randomword')
    end
  end

  context "with separation=:capitalize" do
    subject { Ibsenphrase::Generator.new(separation: :capitalize) }

    it "returns spaced passphrases" do
      expect(subject.passphrase(2)).to eq('RandomwordRandomword')
    end

    context "with Scandinavian characters" do
      before do
        allow(@wordlist).to receive(:draw_word).and_return('ærlig')
      end

      it "capitalizes correctly" do
        expect(subject.passphrase(2)).to eq('ÆrligÆrlig')
      end
    end
  end
end
