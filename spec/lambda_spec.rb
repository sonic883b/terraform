require 'spec_helper'

describe lambda('nortify_to_slack') do
  it { should exist }
  its(:description) { should eq 'An Amazon SNS trigger that sends CloudWatch alarm notifications to Slack.' }
  its(:runtime) { should eq 'python2.7' }
  its(:handler) { should eq 'lambda_function.lambda_handler' }
  its(:code_size) { should eq 1653 }
  its(:timeout) { should eq 3 }
  its(:memory_size) { should eq 128 }
end
