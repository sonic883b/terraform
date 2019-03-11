require 'spec_helper'

describe kms('nortify_to_slack') do
  it { should exist }
  it { should be_enabled }
  its (:arn) { should eq 'arn:aws:kms:ap-northeast-1:695149855287:key/127e8ece-0451-4ae3-bd0a-2716303f6b8f' }


end
