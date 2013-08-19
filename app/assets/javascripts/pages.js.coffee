# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# countdown initializer
weddingDay = new Date(2014, 0, 25)
$('#countdown').countdown({until: weddingDay})

# header hover effect
$('img#header').hover(
  -> $(this).attr('src', '<%= asset_path "header2.jpg" %>'),
  -> $(this).attr('src', '<%= asset_path "header.jpg" %>')
)

# proposal story short/long toggle
@showLong = ->
  $('#short-story').hide()
  $('#long-story').show()

@showShort = ->
  $('#short-story').show()
  $('#long-story').hide()
  window.location = '#proposal'

# form validation
$('form#new_guest').submit ->
  validateForm()

validateForm = ->
  hasErrors = false
  first_name = $('input#guest_first_name').val()
  last_name = $('input#guest_last_name').val()
  address1 = $('input#guest_address1').val()
  city = $('input#guest_city').val()
  state = $('select#guest_state').val()
  zipcode = $('input#guest_zipcode').val()
  country = $('input#guest_country').val()

  if first_name == ''
    $('div.first_name').addClass 'error'
    hasErrors = true
  if last_name == ''
    $('div.last_name').addClass 'error'
    hasErrors = true
  if address1 == ''
    $('div.address1').addClass 'error'
    hasErrors = true
  if city == ''
    $('div.city').addClass 'error'
    hasErrors = true
  if !state?
    $('div.state').addClass 'error'
    $('div.state .custom.dropdown').addClass 'error'
    hasErrors = true
  if zipcode == ''
    $('div.zipcode').addClass 'error'
    hasErrors = true
  if country == ''
    $('div.country').addClass 'error'
    hasErrors = true

  !hasErrors
