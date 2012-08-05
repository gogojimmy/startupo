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
  $(".resource-inputs").popover(trigger: 'focus')
  $('#resourceTypeModal').modal
  type = getUrlVars()["type"]
  switch type
    when "fund"
      $('#fund').addClass "active"
    when "team"
      $('#team').addClass "active"
    when "supplier"
      $('#supplier').addClass "active"
    when "tech"
      $('#tech').addClass "active"
    when "access"
      $('#access').addClass "active"
    when "strategy"
      $('#strategy').addClass "active"
    when "contacts"
      $('#contacts').addClass "active"
    when "activity"
      $('#activity').addClass "active"
    else
      $('#all').addClass "active"
  $('#resource-tabs a:first').tab 'show'
  $(".service").popover(trigger: 'hover')
  $(".service-left").popover(trigger: 'hover', placement: 'left')
