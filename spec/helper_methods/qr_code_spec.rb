require 'spec_helper'

describe HelperMethods do
  describe '.qrcode_for' do
    before do
      @qrcode = qr_code_for(data: 'http://mibuz.com.br', size: 80)
    end

    it { expect(@qrcode).to eq('<img alt="Chart?chl=http%3a%2f%2fmibuz.com" src="https://chart.googleapis.com/chart?chl=http%3A%2F%2Fmibuz.com.br&amp;chs=80&amp;cht=qr" />') }
  end
end
