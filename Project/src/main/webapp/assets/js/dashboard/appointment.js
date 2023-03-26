$(document).ready(function(){
    $("#date").on('change',function(){
        var date = $(this).val();
        console.log(date);
        $.ajax({
            method : 'POST',
            url : 'ajax.jsp',
            data : {dDate : date},
            dataType : "html",
            success : function(data){
                $("#time").html(data);
            }
        });
    });
});