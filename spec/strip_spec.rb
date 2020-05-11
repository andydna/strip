require 'pry'
require 'strip'

$andydna_testing = true

RSpec.describe Strip do
  context 'Unit' do
    context 'class methods' do
      fit 'strips filename extensions' do
        expect(Strip.extension("hello.rb")).to eq "hello"
        expect(Strip.extension("hello.c")).to eq "hello"
      end

      it "can tell if input is filename with extension" do
        expect(Strip.is_fname_with_ext?("hello.rb")).to eq true
        expect(Strip.is_fname_with_ext?("hello")).to eq false
      end
    end

    context 'instance methods' do
      specify "print_output" do
        stub_const('ARGV', ["hello.rb"])
        expect(Strip.new.output).to eq "hello"
      end
    end
  end

  context 'IO' do
    it 'uses ARGV for input' do
      stub_const('ARGV', ["hello"])
      expect(Strip.new.input).to eq "hello"
    end

    it 'prints output' do
      stub_const('ARGV', ["hello.rb"])
      expect {Strip.new.print_output}.to output("hello").to_stdout
    end

  end

  context 'Executable' do
    it 'exists with proper permissions' do
      expect {`./strip`}.not_to raise_error
    end

    fit 'works' do
      expect(`./strip hello.rb`).to eq "hello"
      expect(`./strip goodbye.rb`).to eq "goodbye"
    end
  end
end
