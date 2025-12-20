"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.stud = void 0;
exports.add = add;
function add() {
    var a = [];
    for (var _i = 0; _i < arguments.length; _i++) {
        a[_i] = arguments[_i];
    }
    return a.reduce(function (x, y) { return (x + y); });
}
var stud = /** @class */ (function () {
    function stud(s1) {
        var _this = this;
        this.display = function () {
            console.log("".concat(_this.s1.id, "......").concat(_this.s1.name));
        };
        this.s1 = s1;
    }
    return stud;
}());
exports.stud = stud;
