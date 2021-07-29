require 'pry'
require 'json'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/national_parks/) && req.get?

      national_parks = NationalPark.all.map do |t|
        {
          name: t.name,
          image_url: t.image_url
        }
      end

      return [200, { 'Content-Type' => 'application/json' }, [ {national_parks: national_parks, message: "request successful"}.to_json ]]

    elsif req.path.match(/national_parks/) && req.post?

      newPark = NationalPark.new(JSON.parse(req.body.read))

      if newPark.save 
      return [200, { 'Content-Type' => 'application/json' }, [ {:park => newPark}.to_json ]]
      else 
        return [422, { 'Content-Type' => 'application/json' }, [ {:error => "failed to create"}.to_json ]]
      end

      
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
