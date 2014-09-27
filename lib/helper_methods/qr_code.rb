module HelperMethods

  def qr_code_for(data:, size:)
    url = 'https://chart.googleapis.com/chart'
    params = { chs: size, cht: 'qr', chl: data  }.to_query
    image_tag("#{url}?#{params}")
  end

end
