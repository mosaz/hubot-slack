# Description:
#   Show misawa image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   (misawa) - Show misawa image
#
# Author:
#   Takehiro Adachi

module.exports = (robot) ->
  robot.hear /misawa/i, (msg) ->
    msg.http('http://horesase-boys.herokuapp.com/meigens.json')
        .get() (err, res, body) ->

            # Data is like below
            #
            # [{ id: 1,
            #    title: 'ドラム',
            #    image: 'http://jigokuno.img.jugem.jp/20090111_795235.gif',
            #    character: 'KAZ(32)',
            #    cid: 1,
            #    eid: 1,
            #    body: 'この世に存在するドラムは\n\n全て俺が叩く\n' },
            #  { id: 2,
            #    ti...
            misawaData = JSON.parse(body)

            # select random element and send that element's "image"
            msg.send misawaData[Math.floor(Math.random() * misawaData.length)].image
