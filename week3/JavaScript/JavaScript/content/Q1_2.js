//========================================= Q1 =========================================
let salaries = {
    John: 100,
    Ann: 160,
    Pete:130
}

function salary_sum(obj){
    let sum = 0;
    for (let sal in obj) {
        console.log("Name: "+sal +"     Salary: "+ parseFloat(obj[sal]));
        if (obj.hasOwnProperty(sal)) {
            sum += parseFloat(obj[sal]);
        }
    }
    return sum;
}

console.log("Question 1. SUM: " + salary_sum(salaries));

//========================================= Q2 =========================================
let menu = {
    width: 200,
    height: 300,
    title: "My menu"
}

function multiplyNumeric(obj) {
    for (let i in obj) {
        console.log(i + ": " + obj[i]);
        if (obj.hasOwnProperty(i) && (typeof obj[i] != "string")) {
            obj[i] = parseFloat(obj[i])*2;
        }
    }
}

multiplyNumeric(menu)

for (let i in menu) {
    console.log(i + ": " + menu[i]);
}


