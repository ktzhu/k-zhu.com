class PagesController < ApplicationController
  def index
    respond_to { |format| format.html {render 'pages/about'} }
  end

  def contact
    respond_to { |format| format.html }
  end

  def labs
    respond_to { |format| format.html }
  end
end
