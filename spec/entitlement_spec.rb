#require 'spec_helper'
require './lib/iarrogant.rb'

RSpec.describe "convert_ent_to_xcent" do
  it "Dosen't throw a name exception" do
    begin
      Iarrogant.convert_ent_to_xcent entitlement_path:"path", team_identifier:"identifier", bundle_id:"bundle_id", aps_environment:"aps_environment"
    rescue => e
      e.class.should_not eq(NameError)
    end
  end

  it "Returns something with a file" do
    res = Iarrogant.convert_ent_to_xcent entitlement_path:"./spec/resources/Test.entitlements", team_identifier:"identifier", bundle_id:"bundle_id", aps_environment:"aps_environment"
    res.should_not eq(nil)
  end
end
