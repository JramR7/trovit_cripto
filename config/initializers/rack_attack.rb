Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
Rack::Attack.throttle("requests by ip", limit: 3, period: 1.minute) do |request|
    if request.path == '/user_token' && request.post?
        [ 503, {}, ['Blocked']]
    end
  end