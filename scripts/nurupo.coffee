# Description:
#   ぬるぽ
#
# Commands:
#   ぬるぽ
#

module.exports = (robot) ->
  robot.respond /^ぬるぽ$/i, (msg) ->
    response = ""

      response += "　　Λ＿Λ　　＼＼"
      response += "　 （　・∀・）　　　|　|　ｶﾞｯ"
      response += "　と　　　　）　 　 |　|"
      response += "　　 Ｙ　/ノ　　　 人"
      response += "　　　 /　）　 　 < 　>_Λ∩"
      response += "　 ＿/し'　／／. Ｖ｀Д´）/"
      response += "　（＿フ彡　　　　　 　　/　←>> @#{msg.message.user.name}"

    msg.send response
