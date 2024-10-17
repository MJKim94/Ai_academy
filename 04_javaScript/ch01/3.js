const pi = 3.14;
// pi = 3.141592; 상수는 초기화 후 할당 불가
let sum = 0;
for(var i=0; i<=10 ; i++){
    sum += i;
    console.log('i=', i, '일때까지 누적된 합은 ', sum);
}
console.log('for문 끝');
console.log('for문 후 i값은', i);