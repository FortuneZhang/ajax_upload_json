$(document).ready(function () {

});

function test_1() {
    var data = {
        'name': 'zhangsan',
        'age': 10,
        'hobby':['play games', 'read book', 'eating']
    };
    $.ajax({
        url: '/students/test_json',
        method: 'POST',
        data: data,
        success: function (data) {
            console.log(data)

        },
        error: function () {

        }

    });
}


function test_2() {
    var data = {
        'name': 'zhangsan',
        'age': 10,
        'hobby':['play games', 'read book', 'eating']
    };

    $.ajax({
        url: '/students/test_json2',
        method: 'POST',
        data: {'data': JSON.stringify(data)},
        success: function (data) {
            console.log(data)

        },
        error: function () {

        }

    });
}



