class TopicsController < ApplicationController
  def index
    @topic = Topic.all
    @topic_collection = ContentOrderingService.new(model: @topic).call
  end

  def new; end

  def create; end
end
