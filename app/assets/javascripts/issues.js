$(document).on('turbolinks:load', function() {
  clickIssue()
  })

var a = 'fck'
function clickIssue() {
  $('tbody tr').on('click', function() { 
    // console.log(this.children[4]);
    window.location = $(this).find('td a').attr('href');
  })
}


