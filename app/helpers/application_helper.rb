module ApplicationHelper
  require 'net/http'
  require 'uri'

  def message_to_slack(message)
    url = URI.parse("https://hooks.slack.com/services/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")
    params = {text: message}

    Net::HTTP.post_form(url, {payload: params.to_json})
  end
end
