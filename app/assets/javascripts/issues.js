$(document).on('turbolinks:load', function() {
  clickIssue()
  })

var a = 'fck'
function clickIssue() {
  $('tbody tr td').on('click', function() {
    $('#show')[0].click()
  })
}


