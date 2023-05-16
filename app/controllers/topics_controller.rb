class TopicsController < ApplicationController
  before_action :topic_param, only: [:create]

  def index
    @topic = Topic.all
    p @topic_collection = ContentOrderingService.new(model: @topic).call
  end

  def show
    @article = Topic.find(1).topic_articles.map(&:article)
  end

  def new
    @topic = Topic.new
    @topic.tags.build
  end

  def create
    topic = create_topic(topic_param[:name])
    tag_names = process_tag_collection(topic_param[:tags])
    existing_tags = find_existing_tags(tag_names)
    tag_collection = build_tag_collection(tag_names, existing_tags)

    topic.topic_tags.create!(tag_collection)
    redirect_to topics_path
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def process_tag_collection(tag_params)
    tag_params[:tag_name].delete(' ').split(',')
  end

  def topic_param
    params.require(:topic).permit(:name, tags: [:tag_name])
  end

  def create_topic(name)
    Topic.create(name:)
  end

  def find_existing_tags(tag_names)
    Tag.where(name: tag_names, tag_type: 0)
  end

  def build_tag_collection(tag_names, existing_tags)
    tag_names.map do |value|
      tag = if existing_tags.pluck(:name).include?(value)
              existing_tags.where(name: value).first
            else
              Tag.create(name: value, tag_type: 0)
            end
      { tag: }
    end
  end
end
