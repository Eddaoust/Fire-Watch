$(function () {

    /**
     * Fonction qui fait un appel AJAX pour récupérer les différentes transactions utilisateur

    function refresh() {
        $.ajax({
            url: 'http://127.0.0.1:8000/messenger/ajax',
            type: 'get',
            dataType: 'json'
        })
            .done(function (datas) {
                for(let data of datas){
                    let date = new Date(data.date.timestamp * 1000);
                    console.log(date);
                    $('#messenger').append(`<p><span style="font-weight: bold; color: #4f4f4f">${data.username}</span>: ${data.message}</p>`)
                }
            })
            .fail(function (error) {
                console.error(error.status + ' ' + error.statusText);
            });
    }

    refresh();
     */


    /**
     * Lorsque le message est envoyé, on l'envoi sur le serveur en AJAX afin qu'il soit sauvé en base.
     * Rafraichissement de la page pour intégrer les nouveaux messages
     */
    $('#submit').on('click', function (event) {

        event.preventDefault();
        let messenger = $('#message').val();
        let username = $('#username').val();
        $.ajax({
            url: 'http://127.0.0.1:8000/messenger/ajax_add',
            type: 'post',
            data: {mess: messenger}
        }).done(function () {
            $('#messenger').append(`<p><span style="font-weight: bold; color: #4f4f4f">${username}</span>: ${messenger}</p>`);
            $('#message').val('');
        }).fail(function (error) {
            console.error(error.status + ' ' + error.statusText);
        });
    });
});