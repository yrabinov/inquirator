$(document).on "ready page:load", ->
  $.ajaxSetup
    beforeSend: (xhr, settings) ->
      if not this.crossDomain
        token = $('meta[name=csrf-token]').attr('content')
        xhr.setRequestHeader('X-CSRF-Token', token)