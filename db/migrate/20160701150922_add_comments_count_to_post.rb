class AddCommentsCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer, :default => 0

    Post.pluck(:id).each do |i|
      Post.reset_counters(i, :comments)
    end
  end
end
