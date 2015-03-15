require "iarrogant/version"
require 'plist'

module Iarrogant
  #Convert from normal .Entitlement file to a proper .xcent, returns a string
  def self.convert_ent_to_xcent(entitlement_path:, team_identifier:, bundle_id:, aps_environment:)
    #Decodes into a Hash
    r = Plist::parse_xml(entitlement_path)
    raise "Could not locate entitlement at path #{entitlement_path.inspect}" unless r

    #Set team-identifier
    r['com.apple.developer.team-identifier'] = team_identifier
    r['aps-environment'] = aps_environment
    r['application-identifier'] = "#{team_identifier}.#{bundle_id}"
    r['get-task-allow'] = true

    rtrue.to_plist
  end
end
