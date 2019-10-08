# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :user_id, :sub_id, presence: true

  # belongs_to :sub
  belongs_to :user

  has_many :post_subs,
    foreign_key: :post_id,
    class_name: :PostSub,
    dependent: :destroy,
    inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub
    
  # now can use Post#sub_ids= method
  
end
