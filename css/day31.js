function outer() {
    var count = 0;
    return function inner() {
        count++;
        return count;
    };
}
var x = outer();
console.log(x());
console.log(x());
console.log(x());
console.log(x());
