









var x;
x = $(document);
x.ready(inicio);

function inicio() {
    var x;
    x = $("#verde");
    x.click(muestrame);
    
//    var y;
//    y = $("#campo");
//    y.onkeyup = sugerencias($(this).attr("value"));//$(this).value);
}

function muestrame() {
    var pagina = $(this).attr("href");
    var x = $("#hablame");
    //x.ajaxStart(inicio2);
    
    alert(pagina);
    
    x.load(pagina);
    return false;
}

function inicio2() {
    var x = $("#hablame");
    x.html("Cargando....");
}




function sugerencias(str) {
    var xmlhttp;
    
    if (str.length == 0)
    {
        document.getElementById("txtHint").innerHTML = "";
        return;
    } 
//    alert(str);
    x = $("#txtHint");
    x.load("validar.jsp?correo=" + str);
    //alert("validar.jsp?correo=" + str);
    

}