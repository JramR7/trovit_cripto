require 'httparty'

class FbTokenApi
    def check_fb_token(accessToken)
        access_token = accessToken
        app_id = "287332921890045"
        app_secret = "770af1342c6eb486eaa30bf3d032ccc4"
        base_uri = "https://graph.facebook.com/debug_token?input_token=#{access_token}&access_token=#{app_id}|#{app_secret}"
        
        response = HTTParty.get(base_uri)
    end
end