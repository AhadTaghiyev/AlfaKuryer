$(function () {
    $(".catselect").change(function () {
        let options = $(this).children("option");
        let opt;
        for (var i = 0; i < options.length; i++) {
            if ($(this).val() == $(options[i]).val()) {
                opt = $(options[i]);
                break;
            }
        }
        $(".catwrapper").append(
            '<span data-id="' + $(this).val() + '" class="btn btn-primary  m-2 shopcats">' + $(opt).text() + '</span>' +
            '<input type="hidden" value="' + $(this).val() + '" name="Cats"/>'
        )
    })
    $("body").on("click", ".shopcats", function () {
        let id = $(this).attr("data-id");
        let inputs = document.querySelectorAll(".catwrapper input");
        for (var i = 0; i < inputs.length; i++) {
            if ($(inputs[i]).val() == id) {
                $(inputs[i]).remove();
                break;
            }
        }
        $(this).remove();
        
    })

  
    $(".subcatselect").change(function () {
        let options = $(this).children("option");
        let opt;
        for (var i = 0; i < options.length; i++) {
            if ($(this).val() == $(options[i]).val()) {
                opt = $(options[i]);
                break;
            }
        }
        $(".subcatwrapper").append(
            '<span data-id="' + $(this).val() + '" class="btn btn-primary  m-2 subshopcats">' + $(opt).text() + '</span>' +
            '<input type="hidden" value="' + $(this).val() + '" name="SubCats"/>'
        )
    })
    $("body").on("click", ".subshopcats", function () {
        let id = $(this).attr("data-id");
        let inputs = document.querySelectorAll(".subcatwrapper input");
        for (var i = 0; i < inputs.length; i++) {
            if ($(inputs[i]).val() == id) {
                $(inputs[i]).remove();
                break;
            }
        }
        $(this).remove();

    })
    $(".oldshopcats").click(function () {
        let cat = $(this);
        $.ajax({
            url: "/admin/ajax/removecat/?type=" + cat.attr("data-type") + "&catid=" + cat.attr("data-id"),
            datatype: "json",
            type: "get",
            success: function (res) {
                if (res.status == 200) {
                    cat.remove();
                }
            }

        })
    })
   
})