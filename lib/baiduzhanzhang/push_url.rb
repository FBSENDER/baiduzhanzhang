module Baiduzhanzhang
  class PushUrl
    def self.push(host, token, urls)
      uri = URI.parse("http://data.zz.baidu.com/urls/?site=#{host}&token=#{token}")
      req = Net::HTTP::Post.new(uri.request_uri)
      req.body = urls.join("\n")
      req.content_type = "text/plain"
      result = Net::HTTP.start(uri.hostname, uri.port){|http| http.request(req)}
      result.body
    end
  end
end
