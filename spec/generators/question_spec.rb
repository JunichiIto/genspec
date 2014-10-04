require 'spec_helper'
# FIXME Without this, test fails when ENV['USE_RAILS'] = '1'
require_relative '../../spec/support/generators/question/question_generator'

describe Question do
  context "without input" do
    it "should raise an error" do
      expect { expect(subject).to output("Are you a GOD?") }.to raise_error
    end
  end
  
  with_input "yes" do
    it "should act upon something" do
      expect(subject).to act_upon("something")
      expect(subject).to output(/Acted upon something/)
    end
    
    it "should not raise an error" do
      expect { expect(subject).to output("Good.") }.not_to raise_error
    end
  end

  with_input "no" do
    it "should act upon something" do
      expect(subject).to act_upon("something")
      expect(subject).to output(/Acted upon something/)
    end
    
    it "should not raise an error" do
      expect { expect(subject).to output("You're new around here, aren't you?") }.not_to raise_error
    end
  end
end
