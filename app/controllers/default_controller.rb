class DefaultController < ApplicationController
  def index
    render text: "RESULT: #{PaperTrail::Version.new.reify}"
  end
end
