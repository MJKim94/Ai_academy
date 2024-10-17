let arr = ["홍길동", 22]; // 일반 for, for-in, for-of, forEach()
for(let idx in arr){
    console.log(idx + ":" + arr[idx]);
}
let obj = {'name':'홍길동','age':22};// for-in, for-of
for(let key in obj){
    console.log(key + ":" + obj[key]);
}
// 객체 속성 추가
obj.address = '서울시 관악구';
obj.hobby = '수업 복습하면서 괴로워하기';
for(let key in obj){
    console.log(key + ':', obj[key]);
}
// 객체의 속성 제거
delete(obj.hobby);
console.log('속성 제거후');
for(let key in obj){
    console.log(key + ':', obj[key]);
}