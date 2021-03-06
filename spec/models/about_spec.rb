require 'rails_helper'

RSpec.describe About, type: :model do
  describe "Active false" do
    let(:active) { create(:about) }
    let(:inactive) { create(:about, active: false) }

    it "array without inactive abouts" do
      About.all.should eq [active]
    end
  end
end
