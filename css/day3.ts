function h1(a:number,b:number, callback:Function):number{
    // console.log();
    return callback(a,b);  
}
function add(x:number,y:number):number{
    return x+y;
}

console.log(h1(10,20,add));

async function h2(a:number,b:number, callback:Function):number{
    // console.log();
    var xt:number=0;
    await setTimeout(()=>{xt=callback(a,b)},2000);  
    return xt;
}

console.log(h2(10,20,add));
