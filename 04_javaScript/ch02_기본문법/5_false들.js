// false로 해석되는 값 : 0, '', undefined, NaN, null
var i;
console.log(Boolean(i));
console.log(Boolean(0));
console.log(Boolean(''));
console.log(Boolean(NaN));
console.log(Boolean(null));
console.log();
console.log(Boolean(-9999));

console.log("빈스트링 == false : " + (""==false));
console.log("빈스트링 === false : " + (""===false));
