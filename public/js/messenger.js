$(function () {

    $.ajax({
        url: 'http://127.0.0.1:8000/messenger/ajax',
        type: 'get',
        dataType: 'json'
    })
        .done(function (datas) {
            console.log(datas);
            for(let data of datas){
                $('#messenger').append(`<p>${data.message}</p>`)
            }
        })
        .fail(function (error) {
            console.error(error.status + ' ' + error.statusText);
        });
});