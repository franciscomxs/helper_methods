require 'spec_helper'

describe HelperMethods do
  describe '.bootstrap_icon' do

    before do
      @icon_only = bootstrap_icon(name: 'search')
      @icon_with_text = bootstrap_icon(name: 'search', text: 'Search')
      @icon_with_text_first = bootstrap_icon(name: 'search', text: 'Search', config: :text_first)
    end

    it { expect(@icon_only).to eq('<span class="glyphicon glyphicon-search"></span>') }
    it { expect(@icon_with_text).to eq('<span class="glyphicon glyphicon-search"></span><span class="glyphicon-text">Search</span>') }
    it { expect(@icon_with_text_first).to eq('<span class="glyphicon-text">Search</span><span class="glyphicon glyphicon-search"></span>') }
  end

  describe '.bootstrap_label' do
    before do
      @default_label = bootstrap_label(text: 'Hello')
      @warning_label = bootstrap_label(text: 'Hello', style: :warning)
    end

    it { expect(@default_label).to eq('<span class="label label-default">Hello</span>') }
    it { expect(@warning_label).to eq('<span class="label label-warning">Hello</span>') }
  end

  describe '.bootstrap_badge' do
    before do
      @default_badge = bootstrap_badge(text: '42')
      @pull_right_badge = bootstrap_badge(text: '42', style: 'pull-right')
    end

    it { expect(@default_badge).to eq('<span class="badge ">42</span>') }
    it { expect(@pull_right_badge).to eq('<span class="badge pull-right">42</span>') }
  end
end
