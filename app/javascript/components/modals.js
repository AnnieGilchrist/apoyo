// function() {
//   var modal_button = document.querySelectorAll("modal-button");
//   if (modal_button) {
//     modal_button.addEventListener("change", updateImageDisplay);
//   }
// }

export default function() {
  $('#myModal').on('show.bs.modal', function (event ) {
    var button = $(event.relatedTarget)
    var name = button.data('name')
    var charity = button.data('charity')
    var location = button.data('location')
    var description = button.data('description')
    var modal = $(this)
    modal.find('.modal-title').text("-" + name + "-")
    modal.find('.modal-info .charity').text(charity)
    modal.find('.modal-info .location').text(location)

    // var button = $(event.relatedTarget)
    // var name = button.data('name')
  });
}

// charity location description
