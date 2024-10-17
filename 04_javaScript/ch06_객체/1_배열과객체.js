// class Parson{
//     private String name;
//     private int age
// }
// Person person = new Person("홍길동", 22);

const person = {'name': '홍길동', 'age': 22};
console.log('name :',person.name, ',age :' + person.age);
person.name = '신길동';
console.log('name :',person['name'], ',age :' + person['age']);
const arr = ['홍길동', 22];
arr[0] = '신길동';
console.log(arr[0], arr[0]);