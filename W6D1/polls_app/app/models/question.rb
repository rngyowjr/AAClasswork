# == Schema Information
#
# Table name: questions
#
#  id      :bigint           not null, primary key
#  text    :string           not null
#  poll_id :integer
#

class Question < ApplicationRecord

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll 

  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice

  has_many :responses,
  through: :answer_choices,
  source: :responses 
end
