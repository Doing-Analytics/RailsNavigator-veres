class TopicsController < ApplicationController
  def index
    @topic = Topic.all
  end

  def new; end

  def create; end
end
