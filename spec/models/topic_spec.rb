require 'spec_helper'

describe Topic do

  it { should respond_to(:content) }
  describe "create" do
    it "should be " do
      topic=Topic.create!(:title => "ruby a god")
    end 
  end
end
