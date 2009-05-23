require 'dm-core'
DataMapper.setup(:default, "sqlite3://#{LifeLog.options[:db]}")

require __DIR__('./migrations.rb')
require __DIR__('./models.rb')

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
