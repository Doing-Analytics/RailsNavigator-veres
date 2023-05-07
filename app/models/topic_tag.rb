class TopicTag < ApplicationRecord
  acts_as_list scope: :topic_id

  belongs_to :topic
  belongs_to :tag
end
