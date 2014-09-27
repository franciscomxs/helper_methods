require 'spec_helper'

describe HelperMethods do
  describe '.youtube_video' do
    before do
      @video = youtube_video(id: 's-NtkVZsGQc')
      @large_video = youtube_video(id: 's-NtkVZsGQc', width: 720, height: 360)
    end

    it { expect(@video).to eq('<iframe allowfullscreen="allowfullscreen" height="420" src="http://www.youtube.com/embed/s-NtkVZsGQc" width="580"></iframe>') }
    it { expect(@large_video).to eq('<iframe allowfullscreen="allowfullscreen" height="360" src="http://www.youtube.com/embed/s-NtkVZsGQc" width="720"></iframe>') }
  end

  describe '.youtube_link' do
    before do
      @video = youtube_link(id: 's-NtkVZsGQc')
    end

    it { expect(@video).to eq('<a href="http://www.youtube.com/watch?v=s-NtkVZsGQc">www.youtube.com/watch?v=s-NtkVZsGQc</a>') }
  end
end
