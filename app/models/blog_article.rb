class BlogArticle < ApplicationRecord
  belongs_to :blog
  belongs_to :article
end
