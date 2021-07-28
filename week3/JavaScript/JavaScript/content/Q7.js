/*
 * a.	It starts with between 1 and 6 lowercase English letters denoted by the character class [a-z].
 * b.	The lowercase letter(s) are followed by an optional underscore, i.e. zero or one occurrence of the character.
 * c.	The optional underscore is followed by 0 and 4 optional digits denoted by the character class[0-9].
 */
//Reg [a-z]
let email = ["julia@hackerrank.com",
    "julia_@hackerrank.com",
    "julia_0@hackerrank.com",
    "julia0_@hackerrank.com",
    "julia@gmail.com"];
function validateEmail(strEmail) {
    for (i = 0; i < strEmail.length; i++) {
        if (/^[a-z]{1,6}[_]{0,1}[0-9]{0,4}@hackerrank\.com$/.test(strEmail[i])) {
            console.log(i + "th " + strEmail[i] +"true");
        } else console.log(i + "th " + strEmail[i]+" false");
    }
}


validateEmail(email);