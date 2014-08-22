# Description:
#   shinchoku commands.
#
# Commands:
#   進捗（どうですか|ダメです）
#
# Notes:
#   進捗の具合 

progress = [
  'http://livedoor.blogimg.jp/matometters/imgs/4/c/4cc416b4.jpg'
  'http://forum.shimarin.com/uploads/default/3/5a6b5c05cceb7cf3.png'
  'http://37.media.tumblr.com/3497ded6d8b569cfe0d0152f8fc6bc9d/tumblr_mzyaeoXEIS1sckns5o1_500.jpg'
  'http://draque-ch.com/wp-content/uploads/2014/06/bf80ec2b93465957a856e13a131555be.jpg'
  'http://forum.shimarin.com/uploads/default/6/8b3c7003765d0f2e.jpg'
  'http://38.media.tumblr.com/31ab4065305e3607b951332dde32b789/tumblr_mrkrlyMMIU1sckns5o1_500.jpg'
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/1.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/2.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/6.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/7.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/8.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/9.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/10.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/11.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/12.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/13.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/14.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/15.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/16.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/17.gif"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/18.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/21.jpg"
]

bad = [
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/dame/0.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/dame/1.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/dame/2.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/dame/3.jpg"
  "https://dl.dropboxusercontent.com/u/96769324/img/shinchoku/dame/4.gif"
]

module.exports = (robot) ->

  robot.hear /進捗どうですか/, (msg) ->
    msg.send msg.random progress

  robot.hear /進捗(ダメ|だめ)です/, (msg) ->
    msg.send msg.random bad
