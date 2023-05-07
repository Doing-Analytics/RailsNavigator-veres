require 'faker'

def create_user(email)
  User.create(email:, password: 'password123')
end

def create_blog(name, user)
  Blog.create(name:, user:)
end

def create_topic(name, introduce)
  Topic.create(name:, introduce:)
end

def create_category(name)
  Category.create(name:)
end

def create_tag(name, type)
  tag = Tag.create(name:)
  tag.send("#{type}!")
  tag
end

def create_article(title, content, user, category, tags)
  Article.create(
    title:,
    content:,
    user:,
    category:,
    tags:
  )
end

def create_blog_article(blog, article)
  BlogArticle.create(blog:, article:)
end

def create_topic_article(topic, article)
  TopicArticle.create(topic:, article:)
end

def create_article_tag(article, tag)
  ArticleTag.create(article:, tag:)
end

def create_topic_tag(topic, tag)
  TopicTag.create(topic:, tag:)
end

# Users
user1 = create_user(Faker::Internet.email)
user2 = create_user(Faker::Internet.email)

# Blogs
blog1 = create_blog(Faker::Name.name, user1)
blog2 = create_blog(Faker::Name.name, user2)

# Topics
rails = create_topic('Rails Guide', 'Ning X Ted , 合作翻譯rails guide , 為自己而學，不為誰') if Topic.where(highlighted: true).blank?
topic1 = create_topic(Faker::Quote.singular_siegler, Faker::Quote.famous_last_words)
topic2 = create_topic(Faker::Quote.singular_siegler, Faker::Quote.famous_last_words)

# Categories
category1 = create_category(Faker::Nation.capital_city)
category2 = create_category(Faker::Nation.capital_city)
category3 = create_category(Faker::Nation.capital_city)
category4 = create_category(Faker::Nation.capital_city)

# Tags
tag1 = create_tag(Faker::Color.color_name, :article)
tag2 = create_tag(Faker::Color.color_name, :article)
tag3 = create_tag(Faker::Color.color_name, :article)
tag4 = create_tag(Faker::Color.color_name, :article)
tag_rails = create_tag('Guide', :topic) if rails
tag1_to = create_tag(Faker::Hobby.activity, :topic)
tag2_to = create_tag(Faker::Hobby.activity, :topic)
tag3_to = create_tag(Faker::Hobby.activity, :topic)
tag4_to = create_tag(Faker::Hobby.activity, :topic)
tag5_to = create_tag(Faker::Hobby.activity, :topic)

# Articles
article1 = create_article(Faker::Quotes::Chiquito.term, Faker::Quote.matz, user1, category1, [tag1])
article2 = create_article(Faker::Quotes::Chiquito.term, Faker::Quote.matz, user1, category2, [tag2])
article3 = create_article(Faker::Quotes::Chiquito.term, Faker::Quote.matz, user2, category3, [tag3])
article4 = create_article(Faker::Quotes::Chiquito.term, Faker::Quote.matz, user2, category4, [tag4])

# BlogArticles
create_blog_article(blog1, article1)
create_blog_article(blog1, article2)
create_blog_article(blog2, article3)
create_blog_article(blog2, article4)

# TopicArticles
create_topic_article(topic1, article1)
create_topic_article(topic1, article2)
create_topic_article(topic2, article3)
create_topic_article(topic2, article4)

# ArticleTags
create_article_tag(article1, tag1)
create_article_tag(article2, tag2)
create_article_tag(article3, tag3)
create_article_tag(article4, tag4)

# Topics
topic1 = create_topic(Faker::Book.genre, nil)
topic2 = create_topic(Faker::Book.genre, nil)
topic3 = create_topic(Faker::Book.genre, nil)

# TopicTags
create_topic_tag(topic1, tag_rails) if tag_rails
create_topic_tag(topic1, tag1_to)
create_topic_tag(topic1, tag2_to)
create_topic_tag(topic2, tag3_to)
create_topic_tag(topic3, tag4_to)
create_topic_tag(topic3, tag5_to)
