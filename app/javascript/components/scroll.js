export default function() {
  var objDiv = document.getElementById("messages")

  if (objDiv) {
    window.onload=function () {
      objDiv.scrollTop = objDiv.scrollHeight;
    }
  }
}
