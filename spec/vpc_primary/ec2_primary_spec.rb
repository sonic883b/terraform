require 'spec_helper'

describe ec2('ubuntu') do
  it { should exist }
  it { should be_running }
  its(:instance_id) { should eq 'i-9e61a600' }
  its(:image_id) { should eq 'ami-d8d178b9' }
  its(:private_dns_name) { should eq 'ip-10-0-0-191.ap-northeast-1.compute.internal' }
  its(:public_dns_name) { should eq 'ec2-52-199-125-254.ap-northeast-1.compute.amazonaws.com' }
  its(:instance_type) { should eq 't1.micro' }
  its(:private_ip_address) { should eq '10.0.0.191' }
  its(:public_ip_address) { should eq '52.199.125.254' }
  it { should have_security_group('default') }
  it { should belong_to_vpc('primary') }
  it { should belong_to_subnet('primary_01') }
  it { should have_eip('52.199.125.254') }
  it { should have_ebs('vol-8a58847b') }
end
