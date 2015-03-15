require "iarrogant/version"
require 'plist'

module Iarrogant
  #Convert from normal .Entitlement file to a proper .xcent
  def self.convert_ent_to_xcent(entitlement_path:, team_identifier:, bundle_id:, aps_environment:)
    r = Plist::parse_xml(entitlement_path)
    raise "Could not locate entitlement at path #{entitlement_path.inspect}" unless r
    r
  end
end
