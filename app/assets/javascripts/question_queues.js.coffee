$(document).on "ready page:load", ->
    $('#question_queue_questions').sortable(
        stop: (event,ui) ->
            $('#question_queue_question_order').val($('#question_queue_questions').sortable("toArray", {attribute:"data-question-id"}).join(','))
            queue_id = $('#question_queue_questions').data('id')
            order = $('#question_queue_question_order').val()
            $.ajax
                url:"/question_queues/#{queue_id}"
                type:"PATCH"
                data:  
                    question_queue:
                        question_order: order
                error: (jqXHR, textStatus, errorThrown)->
                    alert "There was a problem reordering the questions. Refresh the page and try again."
    )
# this code is from Gorilla, but keep it around for when you want to add AJAX deletion of questions!
$('.js-delete-brief-section').click ->
    row = $(this).parent().parent()
    $.ajax
        url:"/brief_sections/#{$(this).data('bs-id')}"
        type:"DELETE"
        success: ->
            row.remove()
            $('#campaign_brief_sections').sortable("refresh")