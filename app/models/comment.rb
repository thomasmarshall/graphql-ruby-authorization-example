class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  enum moderation_status: { flagged: 'flagged', hidden: 'hidden' }
end
