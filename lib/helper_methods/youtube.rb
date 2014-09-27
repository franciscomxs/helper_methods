module HelperMethods

  def youtube_video(id:, width: 580, height: 420)
    content_tag :iframe, nil, height: height, width: width, src: "http://www.youtube.com/embed/#{id}", allowfullscreen: true
  end

  def youtube_link(id:, html_options: {})
    link_to "www.youtube.com/watch?v=#{id}", "http://www.youtube.com/watch?v=#{id}", html_options
  end

end
