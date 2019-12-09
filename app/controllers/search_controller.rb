class SearchController < ApplicationController
  def index
    @cities = City.all
    @tertiaries = TertiaryCriteria.all
  end
end
