require_relative '../strip_ext.rb'

RSpec.describe Strip do
  context 'Unit' do
    context 'class methods' do
      it 'strips filename extensions' do
        expect(Strip.extension("hello.rb")).to eq "hello"
        expect(Strip.extension("hello.c")).to eq "hello"
      end

      it "can tell if input is filename with extension" do
        expect(Strip.is_fname_with_ext?("hello.rb")).to eq true
        expect(Strip.is_fname_with_ext?("hello")).to eq false
      end
    end

    context 'instance methods' do
      specify "#output collaborates with class" do
        skip "got to keep moving on"
        klass = class_double(Strip)
        expect(klass).to receive(:extension)
        Strip.new.output
      end

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
      expect {`./strip_ext.rb hello`}.not_to raise_error
    end

    it 'outputs an empty string with no args' do
      expect(`./strip_ext.rb`).to eq ""
    end

    it 'works' do
      expect(`./strip_ext.rb hello.rb`).to eq "hello"
      expect(`./strip_ext.rb goodbye.rb`).to eq "goodbye"
    end
  end
end
