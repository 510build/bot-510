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

aria_icon_url = encodeURI "http://www.moaibu.com/sozai/aria/aria.jpg"
alicia_icon_url = encodeURI "http://www.moaibu.com/sozai/aria/alicia.jpg"

module.exports = (robot) ->

  robot.hear /(社長|しゃちょう)/, (msg) ->
    text = encodeURI msg.random ["にゅ。","にゅ？","ぷいにゅ。"]
    name = "アリア社長"
    channel = msg.envelope.room
    request = msg.http("https://slack.com/api/chat.postMessage?token=#{process.env.SLACK_API_TOKEN}&channel=%23#{channel}&text=#{text}&username=#{name}&icon_url=#{aria_icon_url}&pretty=1").get()
    request (err, res, body) ->

  robot.hear /.*/, (msg) ->
    if (Math.random() * 50) < 1
      name = encodeURI "アリシア"
      text = "あらあらうふふ"
      channel = msg.envelope.room
      request = msg.http("https://slack.com/api/chat.postMessage?token=#{process.env.SLACK_API_TOKEN}&channel=%23#{channel}&text=#{text}&username=#{name}&icon_url=#{alicia_icon_url}&pretty=1").get()
      request (err, res, body) ->
