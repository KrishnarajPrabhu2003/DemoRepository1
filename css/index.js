var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var s1 = "Some name";
console.log(s1);
console.log("Hello ".concat(s1));
// let arr = [1,3,5];
// console.log(arr[0]);
var a = 10;
var v = 20;
var c = 30;
var d; //when we dont give value to this, it becomes undefined
console.log(d);
function f1(n) {
    for (var i = 0; i < n; i++) {
        console.log(i);
    }
    return n;
}
console.log(f1(5));
var a1 = {
    id: 10,
    fname: "Ramu"
};
console.log("".concat(a1.id, " ... ").concat(a1.fname));
var a2 = __assign(__assign({}, a1), { city: "Howrah" });
console.log(a2.city);
function f3() {
    var a3 = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        a3[_i] = arguments[_i];
    }
    a3.forEach(function (element) {
        console.log("".concat(element.id, "...").concat(element.fname, "...").concat(element.city));
    });
}
f3(a2, a2, { id: 3, fname: "Nancy", city: "Hawkins" });
var f4 = function () {
    var a4 = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        a4[_i] = arguments[_i];
    }
    a4.filter(function (x) { return (x % 2 === 0); }).forEach(function (x) {
        console.log(x);
    });
};
f4(10, 20, 30, 40, 50, 60, 2, 3, 4, 5);
