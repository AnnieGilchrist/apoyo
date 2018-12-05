function updateImageDisplay() {
  var input = document.querySelector(".profileUploadInput");
  var preview = document.querySelector(".preview");
  var text = document.querySelector(".circle-text")
  while (preview.firstChild) {
    preview.removeChild(preview.firstChild);
  }

  var curFiles = input.files;
  if (curFiles.length !== 0) {
    for (var i = 0; i < curFiles.length; i++) {
      text.classList.add("hidden-text");
      preview.style.backgroundImage = `url(${window.URL.createObjectURL(curFiles[i])})`;
      preview.classList.add("img-created");
      // var listItem = document.createElement("li");
      // var para = document.createElement("p");
      // var image = document.createElement("img");
      // image.src = window.URL.createObjectURL(curFiles[i]);

      // listItem.appendChild(image);
      // listItem.appendChild(para);

      // list.appendChild(listItem);
    }
  }
}

export default function() {
  var input = document.querySelector(".profileUploadInput");
  var preview = document.querySelector(".preview");
  if (preview) {
    input.style.opacity = 0;
    input.addEventListener("change", updateImageDisplay);
  }
}
