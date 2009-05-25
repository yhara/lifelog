require 'migration_runner'

if LifeLog.options[:no_create_post_table]
  migration 1, :create_posts do
    up {}
    down {}
  end
else
  migration 1, :create_posts do
    up {
      create_table :posts do
        column :id, Integer, :serial => true
        column :posted_at, DateTime
        column :message, String
      end
    }
    down {
      drop_table :posts
    }
  end
end

migration 2, :create_tags do
  up{
    drop_table :tags
    drop_table :taggings
    create_table :tags do
      column :id, Integer, :serial => true
      column :name, String
    end
    create_table :taggings do
      column :id, Integer, :serial => true
      column :tag_id, Integer
      column :post_id, Integer
    end

    Post.all.each do |post|
      if post.__send__(:includes_tag?)
        post.__send__(:scrape_tags).each do |tag_name|
          Ramaze::Log.info("detected tag #{tag_name}")
          tag = Tag.first(:name => tag_name)
          tag ||= Tag.create(:name => tag_name)

          Tagging.create(:post => post, :tag => tag)
        end
      end
    end
  }
  down{
    drop_table :tags
    drop_table :taggings
  }
end

migrate_up!
