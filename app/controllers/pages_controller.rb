class PagesController < ApplicationController
  def home
  	@posts = Tender.all
  end
end
