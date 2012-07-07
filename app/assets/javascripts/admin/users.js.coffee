getUrlVars = ->
  vars = []
  hash = undefined
  hashes = window.location.href.slice(window.location.href.indexOf("?") + 1).split("&")
  i = 0

  while i < hashes.length
    hash = hashes[i].split("=")
    vars.push hash[0]
    vars[hash[0]] = hash[1]
    i++
  vars

jQuery ->
  type = getUrlVars()["type"]
  switch type
    when "culture"
      $('#culture').addClass "active"
    when "digital"
      $('#digital').addClass "active"
    when "it"
      $('#it').addClass "active"
    when "tradition"
      $('#tradition').addClass "active"
    when "high-tech"
      $('#high-tech').addClass "active"
    when "green"
      $('#green').addClass "active"
    when "health"
      $('#health').addClass "active"
    else
      $('#all').addClass "active"
