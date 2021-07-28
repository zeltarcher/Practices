let creditCard = {
    card: 0,
    isValid: false,
    isAllowed: false
}

let swipedCard = "6724843711060148";
let bannedPrefixes = ["11", "3434", "67453", "9"];

function validateCards(swiped, banned) {
    creditCard.card = swiped;
    let checker = swiped[swiped.length - 1];
    let arrSwiped = Array.from(swiped);
    let sum = 0;
    let lastDigit = 0;
    for (i = 0; i < arrSwiped.length; i++) {
        arrSwiped[i] = parseInt(arrSwiped[i]);
    }
    console.log(arrSwiped);

    lastDigit = arrSwiped[arrSwiped.length - 1];
    arrSwiped.pop();
    console.log(arrSwiped);
    for (i = 0; i < arrSwiped.length; i++) {
        arrSwiped[i] *= 2;
        sum += arrSwiped[i];
    }

    if (sum % 10 == lastDigit) {
        console.log("sum= " + sum + " valid true");
        creditCard.isValid = true;
    } else {
        console.log("sum= " + sum + " valid false");
    }

    for (i = 0; i < banned.length; i++) {
        let swipedPrefix = swiped.slice(0, banned[i].length);
        if (swipedPrefix != banned[i]) {
            creditCard.isAllowed = true;
        } else {
            creditCard.isAllowed = false;
        }
    }    
}

validateCards(swipedCard, bannedPrefixes);


let myJSON = JSON.stringify(creditCard);
console.log(myJSON);