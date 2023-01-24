$(document).ready(function(){
    $("#city").on('change',function(){
        var cityName = $(this).val();
        var Speciality = $("#stethoscope").val();
        console.log(cityName);
        console.log(Speciality);
        $.ajax({
            method : 'POST',
            url : 'ajax.php',
            data : {cName : cityName, spec : Speciality},
            dataType : "html",
            success : function(data){
                $("#doc").html(data);
            }
        });
    });
});

$(document).ready(function(){
    $("#doc").on('change',function(){
        var dId = $(this).val();
        console.log(dId);
        $.ajax({
            method : 'POST',
            url : 'ajax.php',
            data : {docId : dId},
            dataType : "html",
            success : function(data){
                $("#date").html(data);
            }
        });
    });
});

$(document).ready(function(){
    $("#date").on('change',function(){
        var date = $(this).val();
        console.log(date);
        $.ajax({
            method : 'POST',
            url : 'ajax.php',
            data : {dDate : date},
            dataType : "html",
            success : function(data){
                $("#time").html(data);
            }
        });
    });
});