// 1. check if the search bar is on the pag
// 2. add click/change listener to ckechbox/dropdown/field
// 3. on click or w/e we find all the elements on the page that have a specific data-business-type attribute
// 4. on each of these elements we add / remove a class || display = none / dsplay = block

const charityButton = document.getElementById('charity');
const missionButton = document.getElementById('mission');
const charities = document.querySelectorAll("[data-type='charity']");
const missions = document.querySelectorAll("[data-type='mission']");
const searchBar = document.querySelector('.search-bar')

function selectedButton (button){
  button.classList.remove("purple-btn");
  button.classList.add("white-btn");
  button.classList.add("selected-btn");
}

function hideCharities (){
  charities.forEach((charity) => {
    charity.style.display = "none";
  });
}

function hideMissions (){
  missions.forEach((mission) => {
    mission.style.display = "none";
  });
}



export default function() {

  if (searchBar) {
    charityButton.addEventListener("click", (event) => {
      selectedButton(charityButton)
      hideMissions ();
    });

    missionButton.addEventListener("click", (event) => {
      selectedButton(missionButton)
      hideCharities ();
    });

  }
}

