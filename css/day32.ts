var url: string = "http://jsonplaceholder.typicode.com/todos";
 
interface users{
    userId:number;
    id:number;
    title:string;
    completed:boolean;
}
 
var userList: any;
fetch(url).then((response)=>{userList=response.json();return userList})
.then((response:users[])=>{console.log(response)
})
.catch((error)=>{console.log(error);
});
 