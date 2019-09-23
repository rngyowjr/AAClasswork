# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :string           not null
#

class User < ApplicationRecord
  validates :id, :username

  has_many :polls,
  
  
end
