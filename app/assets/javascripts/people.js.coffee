@module 'SimpleWebpage', ->
  @module 'PersonEditForm', ->
    @init =->
      $('form#edit_person_form').submit (e) ->
        e.preventDefault()
        self = $(@)
        submit_button = self.find('button[type=submit]')
        submit_button.attr('disabled', 'disabled').text("sending...")

        $.ajax
          url: "#{ self.attr('action') }.json"
          method: 'PUT'
          data: self.serialize()
          success: (data) ->
            if data.success
              $('#edit_person').modal('hide')
              $('.form-group').removeClass('error')
              $('.form-group .small-red').remove()
              window.location.reload()
            else
              $.each data, (key, value) ->
                $('#person_' + key).closest('.form-group').addClass('error') unless $('.form-group#error').length
                $('#person_' + key).after("<p class='small-red'></p>") unless $('#person_' + key).next('p.small-red').length
                $('p.small-red').text(value)

            submit_button.text('Update').removeAttr('disabled')

$ ->
  SimpleWebpage.PersonEditForm.init() if $('form#edit_person_form').length
