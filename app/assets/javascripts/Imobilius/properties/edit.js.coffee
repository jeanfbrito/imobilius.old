
  $('.pictures-upload-button').click ->
    url = $(this).data('url')
    $.ajax
      url: url
      type: "GET"
      success: (data)->
        $('#picturesUpload .modal-body').html(data)
      error: ->
        $('#picturesUpload .modal-body').html("ERROR")
