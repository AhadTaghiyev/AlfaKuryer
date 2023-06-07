function addInputField() {
    var inputsContainer = document.getElementById('inputs-container');
    var inputsRow = document.getElementById('inputRow');
    var newRow = document.createElement('div');
    newRow.classList.add('addresses');
    newRow.innerHTML = `
   <input type="text"  class="input-field col-11 form-control" placeholder="Address" id="PostDto_Adress" name="PostDto.Adress">
    <span class="minus-icon fa-solid fa-minus" onclick="removeAddress(this)"></span>
  `;
    inputsRow.appendChild(newRow);
    attachEventHandlers();
}

// Eksi simgesine tıklandığında ilgili giriş alanını siler
function removeAddress(element) {
    var addressDiv = element.parentNode;
    var inputsRow = document.getElementById('inputRow');
    inputsRow.removeChild(addressDiv);
}

// Artı ve eksi simgelerine olay dinleyicileri ekler
function attachEventHandlers() {
    var plusIcons = document.getElementsByClassName('plus-icon');
    var minusIcons = document.getElementsByClassName('minus-icon');

    for (var i = 0; i < plusIcons.length; i++) {
        plusIcons[i].addEventListener('click', addInputField);
    }

    for (var i = 0; i < minusIcons.length; i++) {
        minusIcons[i].addEventListener('click', removeInputField);
    }
}

// Sayfa yüklendiğinde olay dinleyicileri ekler
document.addEventListener('DOMContentLoaded', attachEventHandlers);



let menuToggle = document.querySelector(".menuToggle");
let navigation = document.querySelector(".navigation");
menuToggle.onclick = function () {
    navigation.classList.toggle("active");
};