require 'spec_helper'

describe vpc('primary') do
  it { should exist }
  it { should be_available }
  its(:vpc_id) { should eq 'vpc-4eaf542a' }
  its(:cidr_block) { should eq '10.0.0.0/16' }
  it { should have_route_table('rtb-0771cc63') }
  it { should have_route_table('primary:route_table') }
  it { should have_network_acl('acl-933f96f7') }
end
