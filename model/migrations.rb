require 'migration_runner'

if LifeLog.options[:no_create_post_table]
  migration 1, :create_posts do
    up {}
    down {}
  end
else
  migration 1, :create_posts do
    up do
      create_table :posts do
        column :id, Integer, :serial => true
        column :posted_at, DateTime
        column :message, String
      end
    end
    down do
      drop_table :posts
    end
  end
end

migrate_up!
