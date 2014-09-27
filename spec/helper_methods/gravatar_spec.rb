require 'spec_helper'

describe HelperMethods do
  describe '.gravatar' do
    before do
      @gravatar = gravatar(email: 'franciscomxs@gmail.com')
    end

    it { expect(@gravatar).to eq('<img alt="Ed51f087eafad0d6e5fd5c55be777330?size=48" src="http://www.gravatar.com/avatar/ed51f087eafad0d6e5fd5c55be777330?size=48" />') }
  end
end
