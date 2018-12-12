// 1. check if the search bar is on the pag
// 2. add click/change listener to ckechbox/dropdown/field
// 3. on click or w/e we find all the elements on the page that have a specific data-business-type attribute
// 4. on each of these elements we add / remove a class || display = none / dsplay = block

const charityButton = document.getElementById('charity');
const missionButton = document.getElementById('mission');
const businessButton = document.getElementById('business');
const charities = document.querySelectorAll("[data-type='charity']");
const missions = document.querySelectorAll("[data-type='mission']");
const businesses = document.querySelectorAll("[data-type='business']")
const searchBar = document.querySelector('.search-bar')

function selectedButton (button) {
  button.classList.remove("white-btn");
  button.classList.add("purple-btn");
  button.classList.add("selected-btn");
}


function unselectedButton (button) {
  button.classList.add("white-btn");
  button.classList.remove("purple-btn");
  button.classList.remove("selected-btn");

}
function hide (elements) {
  elements.forEach((element) => {
    element.style.display = "none";
  });
}

function show (elements) {
  elements.forEach((element) => {
    element.style.display = "";
  });
}




export default function() {

  if (searchBar) {

    charityButton.addEventListener("click", (event) => {
      if (charityButton.classList[4]) { //if charity button is slected
        unselectedButton(charityButton);
        show(missions);
        show(businesses);
      } else { //if charity button is not selected
        if (missionButton.classList[4]) {
          unselectedButton(missionButton);
          show(charities);
        } else if (businessButton.classList[4]) {
          unselectedButton(businessButton);
          show(charities);
        }
        selectedButton(charityButton);
        hide(missions);
        hide(businesses);
      }
    });

    missionButton.addEventListener("click", (event) => {
      if (missionButton.classList[4]) {
        unselectedButton(missionButton);
        show(charities);
        show(businesses);
      } else {
        if (charityButton.classList[4]) {
          unselectedButton(charityButton);
          show(missions);
        } else if (businessButton.classList[4]) {
          unselectedButton(businessButton);
          show(missions);
        }
        selectedButton(missionButton);
        hide(charities);
        hide(businesses);
      }
    });

    businessButton.addEventListener("click", (event) => {
      if (businessButton.classList[4]) {
        unselectedButton(businessButton);
        show(charities);
        show(missions);
      } else {
        if (charityButton.classList[4]) {
          unselectedButton(charityButton);
          show(businesses);
        } else if (missionButton.classList[4]) {
          unselectedButton(missionButton);
          show(businesses);
        }
        selectedButton(businessButton);
        hide(charities);
        hide(missions);
      }
    });
  }
}

