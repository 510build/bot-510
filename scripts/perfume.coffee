# Description:
#   Perfume
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot perfume music - Perfume の MV をランダムに表示
#   チョコレイト - ディスコと応えてくれます。３回に一回フィーバーします
#   (くり返す|くりかえす|繰り返す) - このポリリズム
#

youtube_list = [
  "rBX5YGPNDbs",
  "VZKMaFR2mtU",
  "PXAlCazm3J0",
  "9_ifx-Dmv9g",
  "1WTy2yqKI4w",
  "KbiSxunJatM",
  "gYaxQYf_EdI",
  "K54CYowOqxM",
  "H3RBn3MG8ms",
  "7PtvnaEo9-0",
  "H4znsXCH_2Y",
  "s8_vqfjYpBg",
  "cMsGcW-xaYU",
  "kfqToOh7MVA",
  "NhI2mp-WIck",
  "Dk3jWsARsX4",
]

module.exports = (robot) ->

  robot.respond /perfume\s*music/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=" + msg.random youtube_list

  robot.hear /チョコレイト/, (msg) ->
    robot.brain.data.disco_count =  0 unless robot.brain.data.disco_count
    robot.brain.data.disco_count += 1
    robot.brain.save

    if robot.brain.data.disco_count <  3 then msg.send "ディスコ！"
    if robot.brain.data.disco_count == 3 
      msg.send "ディスコ！ ディスコ！ ディスコ！ https://www.youtube.com/watch?v=1WTy2yqKI4w"
      robot.brain.data.disco_count = 0
      robot.brain.save

  robot.hear /(くり返す|くりかえす|繰り返す)/, (msg) ->
    msg.send "このポリリズム https://www.youtube.com/watch?v=KbiSxunJatM"

