# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Users
user1 = User.create(email: 'ted@example.com', password: 'password123')
user2 = User.create(email: 'ning@example.com', password: 'password123')

# Blogs
blog1 = Blog.create(name: "John's Blog", user: user1)
blog2 = Blog.create(name: "Jane's Blog", user: user2)

# Topics
topic1 = Topic.create(name: 'Travel')
topic2 = Topic.create(name: 'Food')

# Categories
category1 = Category.create(name: 'Asia')
category2 = Category.create(name: 'Europe')
category3 = Category.create(name: 'Appetizers')
category4 = Category.create(name: 'Desserts')

# Tags
tag1 = Tag.create(name: 'Japan')
tag2 = Tag.create(name: 'Italy')
tag3 = Tag.create(name: 'Vegetarian')
tag4 = Tag.create(name: 'Chocolate')

# Articles
article1 = Article.create(title: 'My trip to Tokyo', content: 'I had a wonderful time in Tokyo...', user: user1,
                          category: category1)
article2 = Article.create(title: 'Exploring Rome', content: 'Rome is such an amazing city...', user: user1,
                          category: category2)
article3 = Article.create(title: 'The best vegetarian appetizers',
                          content: 'Here are some delicious vegetarian appetizer recipes...', user: user2, category: category3)
article4 = Article.create(title: 'Chocolate heaven', content: "If you love chocolate, you'll love these desserts...",
                          user: user2, category: category4)

# BlogArticles
BlogArticle.create(blog: blog1, article: article1)
BlogArticle.create(blog: blog1, article: article2)
BlogArticle.create(blog: blog2, article: article3)
BlogArticle.create(blog: blog2, article: article4)

# TopicArticles
TopicArticle.create(topic: topic1, article: article1)
TopicArticle.create(topic: topic1, article: article2)
TopicArticle.create(topic: topic2, article: article3)
TopicArticle.create(topic: topic2, article: article4)

# ArticleTags
ArticleTag.create(article: article1, tag: tag1)
ArticleTag.create(article: article2, tag: tag2)
ArticleTag.create(article: article3, tag: tag3)
ArticleTag.create(article: article4, tag: tag4)
