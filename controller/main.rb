class Main < Controller
  map '/'
  helper :paginate

  trait :paginate => { :limit => 100, :var => "page" }

  def index
    @pager = paginate(Post.all(:order => [:posted_at.desc]))
  end

  def say
    Post.create({
      :posted_at => Time.now,
      :message => request.params["message"],
    })

    redirect '/'
  end

  def search(type, value)
    case type
    when "tag"
      @pager = paginate(Post.all({
        "taggings.tag_id" => Tag.first(:name => value).id,
        :order => [:posted_at.desc]
      }))
      render_view :index
    else
      raise "unknown search type: #{type}"
    end
  end

  private

  def format_message(msg)
    msg.gsub(/#(\S+)/){
      self.anchor("##{$1}", :search, :tag, $1)
    }
  end
end
