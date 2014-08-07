# Description:
#   ぬるぽ
#
# Commands:
# hubot ぬるぽ - 殴られたいとき

module.exports = (robot) ->

  robot.respond /ぬるぽ(.*)/i, (msg) ->
    msg.send """
　　Λ＿Λ　　＼＼
　 （　・∀・）　　　|　|　ｶﾞｯ
　と　　　　）　 　 |　|
　　 Ｙ　/ノ　　　 人
　　　 /　）　 　 < 　>_Λ∩
　 ＿/し'　／／. Ｖ｀Д´）/
　（＿フ彡　　　　　 　　/　←>> @#{msg.message.user.name}

  """
