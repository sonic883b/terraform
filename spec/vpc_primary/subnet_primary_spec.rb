require 'spec_helper'

describe subnet('primary_01') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('primary') }
  its(:subnet_id) { should eq 'subnet-81952ff7' }
  its(:cidr_block) { should eq '10.0.0.0/24' }
end
