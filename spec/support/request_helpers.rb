module Requests
  module JsonHelpers
    def json
      Oj.load(response.body, :symbol_keys => true).with_indifferent_access
    end

    def json_data
      json.dig('data')
    end

    def json_errors
      json.dig('errors')
    end

    def json_attributes
      json.dig('data','attributes')
    end
  end
end
