require 'dm-core'
require 'dm-validations'
require 'dm-aggregates' # needed for #count in spec
DataMapper.setup(:default, "sqlite3://#{LifeLog.options[:db]}")

require __DIR__('./post.rb')
require __DIR__('./tag.rb')
require __DIR__('./migrations.rb')

# 
# ramaze paginate for datamapper
#
require 'ramaze/helper/paginate'
class DataMapper::Collection
  def paginate(page, limit)
    DMCollectionPager.new(self, page, limit)
  end

  class DMCollectionPager < Ramaze::Helper::Paginate::Paginator::ArrayPager
    def each(&block)
      from = ((@page - 1) * @limit)
      from = 0 if from < 0
      to = from + @limit

      a = @array[from...to] || []
      a.each(&block)
    end

  end
end
