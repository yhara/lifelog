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
    type
  end

  private

  def format_message(msg)
    msg.gsub(/#(\S+)/){
      self.anchor("##{$1}", :search, :tag, $1)
    }
  end
end
