class Relationship < ApplicationRecord

  # follower,followedはフォローする人される人の区別をするもの,Userテーブルを参照
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

end
