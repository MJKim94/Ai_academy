function Student(name, kor, mat){
    this.name = name;
    this.kor = kor;
    this.mat = mat;
}
Student.prototype.getSum = function(){
    return this.kor + this.mat;
};
Student.prototype.toString = function(){
    return this.name + '(' + this.kor + ',' + this.mat + ',' + this.getSum() + ')';
};
var students = [new Student("홍", 70, 90),
    new Student("김", 75, 10),
    new Student("곽", 79, 50),
    new Student("지", 90, 60),
    new Student("박", 60, 20),
];
var studentsCopy = [...students];
studentsCopy.sort(function(left, right){
    return right.getSum() - left.getSum();
});
console.log('원본');
students.forEach((data, idx)=>{
    console.log(idx + ',' + data.toString());
});
console.log('원본');
studentsCopy.forEach((data, idx)=>{
    console.log(idx + ',' + data.toString());
});