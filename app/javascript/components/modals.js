export default function() {
  $('#myModal').on('show.bs.modal', function (event ) {
    var button = $(event.relatedTarget)
    var name = button.data('name')
    var charity = button.data('charity')
    var location = button.data('location')
    var description = button.data('description')
    var charityPath = button.data('charityPath')
    var applyPath = button.data('applyPath')
    var modal = $(this)
    modal.find('.modal-title').text("-" + name + "-")
    modal.find('.modal-info .charity').text(charity)
    modal.find('.modal-info .location').text(location)
    modal.find('.modal-body').text(description)
    $('.visit-charity-button').attr('href', charityPath)
    $('.apply-button').attr('href', applyPath)
  });
}

