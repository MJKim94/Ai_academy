/* array함수 : 매개변수 0 : length가 0인 배열 return
 *             매개변수 1 : 매개변수만큼의 크기를 가지는 배열 return
 *             매개변수 2개 이상 : 매개변수로 배열을 생성하여 return */
function array(){
  // arguments(매개변수 배열)에 실행시 매개변수가 들어와
  let result = [];
  if(arguments.length == 1){ // array(4)
    // ex. array(4) : 매개변수(4)만큼 result.push(null)
    for(var cnt=0 ; cnt<arguments[0] ; cnt++){
      result.push(null);
    }
  }else if(arguments.length >=2 ){
    // ex. array(1, 2, 3) : 매개변수랑 같은 배열을 result([1,2,3])로 만듬
    for(var idx=0 ; idx<arguments.length ; idx++){
      result.push(arguments[idx]);
    }
    // 시스템이 자동생성한 배열 arguments는 forEach() 사용불가(일반for문, for-in, for-of)
  }
  return result;
}
console.log('array() = ' + array());
console.log('array(5) = ' + array(5));
console.log('array(1, 2, 13) = ', array(1, 2, 13) );
console.log('array(1, 2, 3, "hello") = ', array(1, 2, 3, 'hello') );