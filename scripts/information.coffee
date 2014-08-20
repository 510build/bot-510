# Description:
#   510ビルに関する情報を流す
#
# Commands:
# hubot 住所 - 住所情報を返す。咄嗟に住所や場所をコピーペーストしたい場合に
# hubot (リポ|りぽ)(.*)l

module.exports = (robot) ->

  robot.respond /住所(.*)/i, (msg) ->
    msg.send """住所を教えてあげるよー。

〒730-0015
広島県広島市中区橋本町１０−１ 橋本町５１０ビル ４０８号
ファナフェクト株式会社
バウハウス

http://www.funaffect.jp/
http://bauhaus-web.jp/

  """

  robot.respond /(リポ|りぽ)(.*)/i, (msg) ->
    msg.send """あいよー。

リポジトリ: https://github.com/510build/bot-510
CI: https://app.wercker.com/#applications/53e64380284f37ea620c7a12
サーバ: http://bot-510.herokuapp.com/
  """
