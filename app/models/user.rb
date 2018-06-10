# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :posts
  action_store :like, :post, counter_cache: true, user_counter_cache: :liking_count

  def self.t
    User.delete_all
    10.times{
      User.create(name: Faker::Name.name)
    }
    Post.delete_all
    20.times{
      Post.create(title: Faker::Lorem.sentence, user_id: User.ids[rand(User.ids.count)])
    }
    Action.delete_all
    User.all.each do |u|
      rand(5).times{
        u.create_action(:like, target: Post.find(Post.ids[rand Post.ids.count]))
      }
    end
  end
end
