# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $(".newspaper-description").click ->
    $.getJSON "newspapers/" + $(this).attr("data-id"), (data) ->
      panel = $('#content-holder').find('#description-panel')
      if panel.length < 1
        panel = $('<div>').attr('id', 'description-panel')
                          .addClass('col-sm-6')
                          .append($('<div>').addClass('panel panel-default')
                                            .append($('<div>').addClass('panel-heading clearfix')
                                                              .append($('<h1>').addClass('panel-title pull-left')
                                                                               .append('Kirjeldus')
                                                                               .css('padding-top', '7.5px'))
                                                              .append($('<div>').addClass('btn-group pull-right')
                                                                                .append($('<a>').attr('href', '#')
                                                                                                .addClass('btn btn-default btn-sm')
                                                                                                .append($('<span>').addClass('icon-remove'))
                                                                                                .click ->
                                                                                                  $('#description-panel').hide()
                                                                                                  false
                                                                                                )))
                                            .append($('<div>').addClass('panel-body')
                                                              .append($('<div>').addClass('form-horizontal')
                                                                                .append($('<div>').addClass('form-group')
                                                                                                  .append($('<label>').addClass('col-sm-3 control-label')
                                                                                                                      .append('Ajalehe id:'))
                                                                                                  .append($('<div>').addClass('col-sm-9')
                                                                                                                    .append($('<p>').addClass('form-control-static newspaper-id'))))
                                                                                .append($('<div>').addClass('form-group')
                                                                                                  .append($('<label>').attr('for', 'description')
                                                                                                                      .addClass('col-sm-3 control-label')
                                                                                                                      .append('Kirjeldus:'))
                                                                                                  .append($('<div>').addClass('col-sm-9')
                                                                                                                    .append($('<textarea>').addClass('form-control')
                                                                                                                                           .attr('rows', '5')
                                                                                                                                           .attr('readonly', 'readonly')
                                                                                                                                           .attr('name', 'description')))))))
        panel.appendTo('#content-holder')
      $('#description-panel .newspaper-id').text(data.id || '')
      $('#description-panel textarea[name="description"]').text(data.description || '')
      panel.show()
    false

$(document).ready(ready)
$(document).on('page:load', ready)
