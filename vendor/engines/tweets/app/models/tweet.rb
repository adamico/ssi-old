class Tweet < ActiveRecord::Base

  acts_as_indexed :fields => [:body]

  validates :body, :presence => true, :uniqueness => true
  
  def truncated_body(length=80)
    body.truncate(length)
  end
end
