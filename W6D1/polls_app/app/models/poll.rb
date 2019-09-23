class Poll < ApplicationRecord

  validates :author_id, :title

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

end