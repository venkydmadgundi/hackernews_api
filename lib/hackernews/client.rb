module Hackernews
  class Client
    def initialize
      @host = 'community-hacker-news-v1.p.rapidapi.com'
      @host = 'hacker-news.firebaseio.com/v0'
      @key = 'a1fe41ba72msh720397065df6c9dp1c4973jsn6fed9033fc00'
    end

    def item(id)
      get("item/#{id}")
    end

    def userprofile(user_id)
      get("user/#{user_id}")
    end

    ["top", "ask", "show", "job"].each do |method|
      define_method(:"#{method}stories") do
        stories = get("#{method}stories")[0...10]
        stories.map! do |story|
          item(story)
        end  
        stories
      end
    end

    private

    def get(path)
      response = Excon.get(
        'https://' + @host + '/' + path + '.json?print=pretty',
        headers: {
          'x-rapidapi-host' => @host,
          'x-rapidapi-key' => @key,
        }
      )
      return false if response.status != 200
      JSON.parse(response.body)
    end
  end
end
