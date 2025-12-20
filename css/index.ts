var s1:string = "Some name";
console.log(s1);
console.log(`Hello ${s1}`);
// let arr = [1,3,5];
// console.log(arr[0]);
let a:Number=10;
var v:Number=20;
const c:Number = 30;
let d:any; //when we dont give value to this, it becomes undefined
console.log(d);

function f1(n:Number):Number{
    for(let i=0;i<n;i++){
        console.log(i);
    }
    return n;
}
console.log(f1(5))

interface studenti{
    id:number;
    fname: string;

}

var a1:studenti={
    id:10,
    fname:"Ramu"
}
console.log(`${a1.id} ... ${a1.fname}`)

interface studenti2{
    id:number;
    fname: string;
    city:string;

}

var a2:studenti2={
    ...a1,
    city:"Howrah"
}
console.log(a2.city);

function f3(...a3:studenti2[]){
    a3.forEach(element => {
        console.log(`${element.id}...${element.fname}...${element.city}`)
    });
}

f3(a2,a2,{id:3,fname:"Nancy",city:"Hawkins"})

var f4 = function(...a4:number[]){
    a4.filter((x)=>(x%2===0)).forEach((x)=>{console.log(x);
    })
}

f4(10,20,30,40,50,60,2,3,4,5)