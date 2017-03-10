# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  author     :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  #validades se hacen así
  validates :author, :title , :content , presence: true
  validates :title ,length: { in: 2..50 }
  validates :content,length: { in: 1..500 }

end
