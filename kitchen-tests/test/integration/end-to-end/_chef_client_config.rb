client_rb = if os.windows?
              'C:\chef\client.rb'
            else
              '/etc/chef/client.rb'
            end
puts "\n\nTEST1 = #{File.exist?(client_rb).inspect}\nTEST2 = #{File.read(client_rb).inspect}\n\n"
describe file(client_rb) do
  it { should exist }
  its("content") { should match(%r{chef_server_url "https://localhost"}) }
  its("content") { should match(/chef_license "accept"/) }
  its("content") { should match(%r{rubygems_url "https://rubygems.org/"}) }
  its("content") { should match(/require 'aws-sdk'/) }
end
