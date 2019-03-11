require 'spec_helper'


describe cloudwatch_alarm('ubuntu_cpu') do
  it { should exist }
  it { should have_ok_action('arn:aws:sns:ap-northeast-1:695149855287:nortify_to_slack') }
  it { should have_alarm_action('arn:aws:sns:ap-northeast-1:695149855287:nortify_to_slack') }
  it { should have_insufficient_data_action('arn:aws:sns:ap-northeast-1:695149855287:nortify_to_slack') }
  it { should belong_to_metric('CPUUtilization').namespace('AWS/EC2') }
  its(:state_value) { should eq 'OK' }
  its(:statistic) { should eq 'Average' }
  its(:period) { should eq 300 }
  #its(:unit) { should eq '' }
  its(:evaluation_periods)  { should eq 2 }
  its(:threshold)  { should eq 70 }
  its(:comparison_operator)  { should eq 'GreaterThanOrEqualToThreshold' }
end

describe cloudwatch_alarm('ubuntu_status') do
  it { should exist }
  it { should have_ok_action('arn:aws:sns:ap-northeast-1:695149855287:nortify_to_slack') }
  it { should have_alarm_action('arn:aws:sns:ap-northeast-1:695149855287:nortify_to_slack') }
  it { should have_insufficient_data_action('arn:aws:sns:ap-northeast-1:695149855287:nortify_to_slack') }
  it { should belong_to_metric('StatusCheckFailed').namespace('AWS/EC2') }
  its(:state_value) { should eq 'OK' }
  its(:statistic) { should eq 'Minimum' }
  its(:period) { should eq 60 }
  #its(:unit) { should eq '' }
  its(:evaluation_periods)  { should eq 1 }
  its(:threshold)  { should eq 2.0 }
  its(:comparison_operator)  { should eq 'GreaterThanOrEqualToThreshold' }
end