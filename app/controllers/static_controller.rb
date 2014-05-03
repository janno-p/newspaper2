class StaticController < ApplicationController
  def log
    render text: File.read(File.join(Rails.root, 'log', "#{Rails.env}.log")), content_type: 'text/plain'
  end
end
