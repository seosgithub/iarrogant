require "iarrogant/version"

module Iarrogant
  #Convert from normal .Entitlement file to a proper .xcent
  def convert_ent_to_xcent(entitlement_path:, team_identifier:, bundle_id:, aps_environment:)
    r = Plist::parse_xml(entitlement_path)
    puts r
  end
end
