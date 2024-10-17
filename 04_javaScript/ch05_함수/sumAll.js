function sumAll(){
  // 매개변수가 0개 : -999 return
  // 매개변수가 1개이상 : 매개변수들 누적합 return
  var result = 0;
  if(arguments.length == 0){
    result = -999;
  }else if(arguments.length >= 1 ){
    for(let idx = 0 ; idx<arguments.length ; idx++){
      result += arguments[idx]; //result = result + arguments[idx];
    }
  }
  return result;
}
console.log("sumAll() = ", sumAll());
console.log("sumAll(1, 2, 3, 4, 5, 6) = ", sumAll(1, 2, 3, 4, 5, 6));
console.log("sumAll(10, 20) = ", sumAll(10, 20));