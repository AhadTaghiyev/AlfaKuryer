document.getElementById("form").addEventListener("submit", function (event) {
    event.preventDefault();

    var form = document.getElementById("form");
    if (!form || !(form instanceof HTMLFormElement)) {
        console.error("Error: Form element not found.");
        return;
    }

    var formData = new FormData(form);

    fetch("/Contact/Send", {
        method: "POST",
        headers: {
            "RequestVerificationToken": document.querySelector('input[name="__RequestVerificationToken"]').value
        },
        body: formData
    })
        .then(response => response.json())
        .then(data => {
            if (data.status === 200) {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Uğurla göndərildi',
                    showConfirmButton: false,
                    timer: 1500
                })
            } else {
                Swal.fire({
                    title: data,
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                })
            }
        })
        .catch(error => {
            console.log("Error: " + error);
        });
});