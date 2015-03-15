#require 'spec_helper'
require './lib/iarrogant.rb'
require 'tempfile'
require 'securerandom'

RSpec.describe "convert_ent_to_xcent" do
  it "Dosen't throw a name exception" do
    begin
      Iarrogant.convert_ent_to_xcent entitlement_path:"path", team_identifier:"identifier", bundle_id:"bundle_id", aps_environment:"aps_environment"
    rescue => e
      e.class.should_not eq(NameError)
    end
  end

  it "Returns a string with a real entitlements file path" do
    res = Iarrogant.convert_ent_to_xcent entitlement_path:"./spec/resources/Test.entitlements", team_identifier:"identifier", bundle_id:"bundle_id", aps_environment:"aps_environment"
    res.class.should eq(String)
  end

  it "Returns a plistable string with a real entitlement file path" do
    res = Iarrogant.convert_ent_to_xcent entitlement_path:"./spec/resources/Test.entitlements", team_identifier:"identifier", bundle_id:"bundle_id", aps_environment:"aps_environment"

    f = Tempfile.new('iarrogant')
    f.write(res)
    f.close
    k = Plist::parse_xml(f.path)
    k.class.should eq(Hash)
  end

  it "Returns a plistable string that contains the correct team identifier" do
    team_identifier = "#{SecureRandom.hex}"
    res = Iarrogant.convert_ent_to_xcent entitlement_path:"./spec/resources/Test.entitlements", team_identifier:team_identifier, bundle_id:"bundle_id", aps_environment:"aps_environment"

    f = Tempfile.new('iarrogant')
    f.write(res)
    f.close
    k = Plist::parse_xml(f.path)
    k["com.apple.developer.team-identifier"].should eq(team_identifier)
  end

  it "Returns a plistable string that contains the correct aps environment" do
    team_identifier = "#{SecureRandom.hex}"
    aps_environment = 'production'
    res = Iarrogant.convert_ent_to_xcent entitlement_path:"./spec/resources/Test.entitlements", team_identifier:team_identifier, bundle_id:"bundle_id", aps_environment:aps_environment

    f = Tempfile.new('iarrogant')
    f.write(res)
    f.close
    k = Plist::parse_xml(f.path)
    k["aps-environment"].should eq(aps_environment)
  end

  it "Returns a plistable string that contains the correct application identifier" do
    team_identifier = "#{SecureRandom.hex}"
    aps_environment = 'production'
    bundle_id = "com.#{SecureRandom.hex}"
    res = Iarrogant.convert_ent_to_xcent entitlement_path:"./spec/resources/Test.entitlements", team_identifier:team_identifier, bundle_id:bundle_id, aps_environment:aps_environment

    f = Tempfile.new('iarrogant')
    f.write(res)
    f.close
    k = Plist::parse_xml(f.path)
    k["application-identifier"].should eq("#{team_identifier}.#{bundle_id}")
  end

  it "Returns a plistable string that contains a true get-task-allow" do
    team_identifier = "#{SecureRandom.hex}"
    aps_environment = 'production'
    bundle_id = "com.#{SecureRandom.hex}"
    res = Iarrogant.convert_ent_to_xcent entitlement_path:"./spec/resources/Test.entitlements", team_identifier:team_identifier, bundle_id:bundle_id, aps_environment:aps_environment

    f = Tempfile.new('iarrogant')
    f.write(res)
    f.close
    k = Plist::parse_xml(f.path)
    k["get-task-allow"].should eq(true)
  end
end
