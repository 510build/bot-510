# Description:
#   ARIA
#   社長とアリシアさんがときどき反応します。
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   社長 - アリア社長が反応します
#

aria_icon_url = "http://www.moaibu.com/sozai/aria/aria.jpg"
alicia_icon_url = "http://www.moaibu.com/sozai/aria/alicia.jpg"

request = (msg, config) ->
  params = []
  config.pretty = 1
  config.token = process.env.SLACK_API_TOKEN
  config.channel =  "#" + msg.envelope.room
  for key,value of config
    escape_value = encodeURIComponent value
    params.push "#{key}=#{escape_value}"
  param = params.join("&")
  url = "https://slack.com/api/chat.postMessage?#{param}"
  console.log url
  req = msg.http(url).get()
  req (err, res, body) ->

send_alicia = (msg, text) ->
  request msg,
    username: "アリシア"
    text: text
    icon_url: alicia_icon_url

send_aria = (msg, text) ->
  request msg,
    username: "アリア社長"
    text: text
    icon_url: aria_icon_url

module.exports = (robot) ->

  robot.hear /(社長|しゃちょう)/, (msg) ->
    send_aria msg, msg.random ["にゅ。","にゅ？","ぷいにゅ。"]

  robot.hear /.*/, (msg) ->
    if (Math.random() * 50) < 1
      send_alicia msg, "あらあらうふふ"

  robot.hear /あらあら$/, (msg) ->
    send_alicia msg, "うふふ。"

  robot.hear /うふふ$/, (msg) ->
    send_alicia msg, "あらあら。"
