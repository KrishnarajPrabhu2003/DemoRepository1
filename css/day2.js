function f1(){
    var n = parseInt(document.getElementById("a1").value);
    var s1 = "<table>"
    for(var i=1;i<=10;i++){
        s1=s1+"<tr><td>"+n+"</td><td>x</td><td>"+i+"</td><td>=</td><td>"+(n*i)+"</td></tr>"
    
    }
    s1=s1+"</table>"
    document.getElementById("t1").innerHTML = s1;

}