require 'dm-core'
DataMapper.setup(:default, "sqlite3://#{LifeLog.options[:db]}")

require __DIR__('./migrations.rb')
require __DIR__('./models.rb')

