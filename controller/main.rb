class Main < Controller
  map '/'

  def index
    @posts = Post.all(:order => [:posted_at.desc])
  end

  def say
    Post.create({
      :posted_at => Time.now,
      :message => request.params["message"],
    })

    redirect '/'
  end
end
