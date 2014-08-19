# Description:
#   だれがオフィスにいるか調べられる
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   おるん(か|や)
#
# URLS:
#   /orca/:macs/

members = {}
for key,mac of process.env
  if key.match /^MEMBERS_/
    member = key[8..-1].toLowerCase()
    members[mac] = member

spawn = require('child_process').spawn

module.exports = (robot) ->
  if !robot.brain.data.macs
    robot.brain.data.macs = []
    robot.brain.save()

  robot.router.get "/orca//", (req, res) ->
    robot.brain.data.macs = []
    robot.brain.save()
    res.end "OK"

  robot.router.get "/orca/:macs/", (req, res) ->
    robot.brain.data.macs = req.params.macs.split(",")
    robot.brain.save()
    res.end "OK"

  robot.hear /おるん(か|や)/, (msg) ->
    macs = robot.brain.data.macs
    users = []
    for i,mac of macs
      if user = members[mac]
        users.push user

    text = ""
    if users.length == 0
      text = "事務所には誰もいないよ。"
    else
      text = "事務所には\n"
      for i,user of users
        text += "* @#{user}\n"
      text += "がいるよ。"
    msg.send text
