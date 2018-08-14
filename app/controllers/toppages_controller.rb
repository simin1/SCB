class ToppagesController < ApplicationController
  def index
    @topics = Topic.all
  end
end
