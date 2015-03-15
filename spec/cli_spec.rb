require './lib/iarrogant.rb'
require 'tempfile'
require 'securerandom'

def ensure_tmp
  tmp_spec_path = './spec/tmp'
  Dir.mkdir(tmp_spec_path) unless File.exists?(tmp_spec_path)
end

RSpec.describe "CLI" do
  it "Writes correctly to an absolutely pathed file" do
    #Get a temporary file, delete it, but save the path
    temp = Tempfile.new "iarrogant-cli"
    path = temp.path
    temp.close
    temp.unlink

    `ruby -Ilib ./bin/iarrogant convert ./spec/resources/Test.entitlements WLKDY3CXPR com.fittr production #{path}`

    (File.exist? path).should eq(true)
  end

  it "Writes correctly to an relativly pathed file" do
    ensure_tmp

    #Create a randomw file
    path = "./spec/tmp/#{SecureRandom.hex}"

    `ruby -Ilib ./bin/iarrogant convert ./spec/resources/Test.entitlements WLKDY3CXPR com.fittr production #{path}`

    (File.exist? path).should eq(true)
  end

  it "Creates a file with somethnig in it" do
    ensure_tmp

    #Create a randomw file
    path = "./spec/tmp/#{SecureRandom.hex}"

    `ruby -Ilib ./bin/iarrogant convert ./spec/resources/Test.entitlements WLKDY3CXPR com.fittr production #{path}`

    (File.read(path).length.should be > 0)
  end

  it "Creates a file that starts with <?xml" do
    ensure_tmp

    #Create a randomw file
    path = "./spec/tmp/#{SecureRandom.hex}"

    `ruby -Ilib ./bin/iarrogant convert ./spec/resources/Test.entitlements WLKDY3CXPR com.fittr production #{path}`

    #Starts with <?xml
    str = File.read(path)
    pos = str =~ /\<\?xml/
    pos.should eq(0)
  end
end
