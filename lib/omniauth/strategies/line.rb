require "jwt"

module OmniAuth
  module Strategies
    class Line < OmniAuth::Strategies::OAuth2
      def info
        base = {}

        if (id_token = access_token.params["id_token"])
          payload, = JWT.decode(id_token, nil, false)
          base["email"] = payload["email"] if payload["email"]
        end

        base
      end
    end
  end
end
