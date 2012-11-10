require 'spec_helper'

describe "topic" do
  subject { page }

  describe "topics index" do
    before { visit topics_path }

    it { should have_selector("title", :text => "topics") }
  end
end 
