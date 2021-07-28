let arr = [
    "James",
    "Brennie"
];
console.log(arr);
arr.push("Robert");
console.log(arr);

arr[Math.floor(arr.length/2)] = "Calvin";
console.log(arr);

arr.shift();
console.log(arr);

arr.unshift("Rose", "Regal");
console.log(arr);
