window.BufferLoader = (context, url, callback) ->
  @context = context
  @url = url
  @onload = callback
  @buffer = null
  @loadCount = 0

BufferLoader::loadBuffer = (url) ->
  
  # Load buffer asynchronously
  request = new XMLHttpRequest()
  request.open "GET", url, true
  request.responseType = "arraybuffer"
  loader = this
  request.onload = ->
    
    # Asynchronously decode the audio file data in request.response
    loader.context.decodeAudioData request.response, ((buffer) ->
      unless buffer
        alert "error decoding file data: " + url
        return
      loader.buffer = buffer
      loader.onload(buffer);
    ), (error) ->
      console.error "decodeAudioData error", error


  request.onerror = ->
    alert "BufferLoader: XHR error"

  request.send()

BufferLoader::load = ->
  this.loadBuffer @url


window.playSound = (context, buffer, time) ->
  source = context.createBufferSource()
  source.buffer = buffer
  source.connect context.destination
  source.start = source.noteOn  unless source.start
  source.start time

