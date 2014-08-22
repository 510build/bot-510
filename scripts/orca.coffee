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
#   /お(る|ら)ん?(か|や)/ - オフィスに誰がいるのか
#   hubot おる - オフィスにいることにできる(最長10分)
#   hubot 帰る - オフィスにいないことにできる(最長10分)
#   hubot orca add [user] [mac]
#   hubot orca remove [user]
#   hubot orca list
#
# URLS:
#   /orca/:macs/

spawn = require('child_process').spawn

module.exports = (robot) ->
  robot.brain.on "loaded", (data) ->
    if data.macs
      delete data.macs

    if !data._private.orca
      robot.brain.set("orca", {members: {}, macs: []})
      robot.brain.save()

  putList = (msg) ->
    orca = robot.brain.get("orca")
    text = "MACアドレスの一覧です〜\n"
    for mac, user of orca.members
      text += "#{user} : #{mac}\n"
    msg.send text

  robot.router.get "/orca//", (req, res) ->
    orca = robot.brain.get("orca")
    orca.macs = []
    robot.brain.set("orca", orca)
    res.end "OK"

  robot.router.get "/orca/:macs/", (req, res) ->
    orca = robot.brain.get("orca")
    orca.macs = req.params.macs.split(",")
    robot.brain.set("orca",orca)
    res.end "OK"

  robot.respond /orca add (.*) (.*)/i, (msg) ->
    user = msg.match[1]
    mac = msg.match[2]
    orca = robot.brain.get "orca"
    orca.members[mac] = user
    robot.brain.set "orca", orca
    robot.brain.save()
    putList(msg)

  robot.respond /orca (remove|delete) (.*)/i, (msg) ->
    orca = robot.brain.get "orca"
    user = msg.match[2]
    for mac, u of orca.members
      if u == user
        delete orca.members[mac]
        robot.brain.set "orca", orca
    putList(msg)

  robot.respond /orca list/i, (msg) ->
    putList(msg)

  robot.respond /おる/, (msg) ->
    name = msg.envelope.user?.name
    orca = robot.brain.get "orca"
    for mac, user of orca.members
      if user == name
        orca.macs.push mac
        robot.brain.set "orca", orca
        robot.brain.save()
    msg.send msg.random ['えー、嘘じゃないよね？','はいはーい。いらっしゃいませー。']

  robot.respond /帰る/, (msg) ->
    name = msg.envelope.user?.name
    orca = robot.brain.get "orca"
    for mac, user of orca.members
      if user == name
        for i,m of orca.macs
          if m == mac
            orca.macs.splice(i,1)
            robot.brain.set "orca", orca
            robot.brain.save()
    msg.send msg.random ['えー、帰っちゃうのー。','はいよー。おつかれさまです。']

  robot.hear /お(る|ら)ん?(よ|か|や)/, (msg) ->
    orca = robot.brain.get "orca"
    macs = robot.brain.data.macs
    users = []
    for mac in orca.macs
      if user = orca.members[mac]
        users.push user

    text = ""
    if users.length == 0
      text = "事務所には誰もいないよ。"
    else
      text = "事務所には\n"
      for user in users
        text += "* @#{user}\n"
      text += "がいるよ！"
    msg.send text
