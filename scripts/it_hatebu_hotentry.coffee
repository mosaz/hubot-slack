# Description:
#   Get latest IT hotentries from http://b.hatena.ne.jp/
#
# Commands:
#   hubot hatebu - Get IT hotentries
#
# Author:
#   takashi

module.exports = (robot) ->
  robot.respond /(hatebu)/i, (msg) ->
    getHatebu msg, (entries) ->
      msg.send entries


getHatebu = (msg, callback) ->
  msg.http('https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://b.hatena.ne.jp/hotentry/it.rss&num=10')
    .get() (err, res, body) ->
      data = JSON.parse(body)
      data = data.responseData?.feed?.entries
      if data?.length > 0
        data = parseJsonData data
        callback data

parseJsonData = (data) ->
  entries = []
  for d in data
    entries.push "#{d.title} - #{d.link}"
  entries.join '\n'
