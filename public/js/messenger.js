$(function () {

    function refresh() {
        $.ajax({
            url: 'http://127.0.0.1:8000/messenger/ajax',
            type: 'get',
            dataType: 'json'
        })
            .done(function (datas) {
                for(let data of datas){
                    $('#messenger').append(`<p><strong>${data.username}</strong>: ${data.message}</p>`)
                }
            })
            .fail(function (error) {
                console.error(error.status + ' ' + error.statusText);
            });
    }

    refresh();


    $('#submit').on('click', function () {

        let messenger = $('#message').val();
        console.log(messenger);
        $.ajax({
            url: 'http://127.0.0.1:8000/messenger/ajax_add',
            type: 'post',
            data: {mess: messenger}
        }).done(function () {
            $('#messenger').html('');
            refresh();
        }).fail(function (error) {
            console.error(error.status + ' ' + error.statusText);
        });
    });
});