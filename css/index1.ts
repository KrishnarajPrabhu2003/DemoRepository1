export function add(...a:number[]):number{
    return a.reduce((x,y)=>(x+y));
}

export class stud{
  public s1:studenti;
  constructor(s1:studenti){
        this.s1=s1;
  }

  display = ()=>{
    console.log(`${this.s1.id}......${this.s1.name}`);
    
  }
}

interface studenti{
    id:number;
    name:string;
}