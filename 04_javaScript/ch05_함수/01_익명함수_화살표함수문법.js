let funVar = function(){
  console.log('매개변수 없는 함수 호출');
  console.log('TEST');
};
funVar = () => {
  console.log('1. 매개변수 없는 구현이 2줄 이상인 화살표 함수 호출');
  console.log('TEST');
};
funVar();
funVar = () => console.log('2. 매개변수 없는 구현이 1줄인 화살표 함수 호출');
funVar();
funVar = i => {
  console.log('3. 매개변수 1개이고, 구현이 2줄이상 화살표 함수 호출 값 :' + i);
  console.log('TEST');
};
funVar(10);
funVar = i => console.log('4. 매개변수 1개이고, 구현이 1줄인 화살표 함수 호출 : ' + i);
funVar(20);
funVar = (i, j) => console.log('5. 매개변수 2개 이상 함수 호출') ;
funVar(10,20);
funVar = function(i, j){
  return i*10+j;
}
funVar = (i, j) => i*10 + j;  // 위 함수표현식과 동일
console.log('6. return이 있는 화살표 함수 호출 : ' + funVar(1, 2));
funVar = function(x){
  return x*x;
};
funVar = x => x*x;
console.log('7. 매개변수 1개, return이 있는 화살표 함수 호출 : ' + funVar(5));