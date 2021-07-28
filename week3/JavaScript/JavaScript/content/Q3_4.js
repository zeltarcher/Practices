//========================================= Q3 =========================================

function checkEmail() {
    let string3;
    if (document.querySelector('#txt3').value != null)
        string3 = document.querySelector('#txt3').value;
    else
        string3 = null;
    console.log("string3: "+string3);
    console.log("index of @: "+string3.indexOf("@"));
    console.log("index of .: " + string3.indexOf("."));
    console.log((string3.indexOf(".") - string3.indexOf("@")));
    if ((string3.includes("@")) && (string3.includes("."))) {
        if ((string3.indexOf("@") > string3.indexOf(".")) || ((string3.indexOf(".") - string3.indexOf("@")) <= 1)) {
            console.log("false, @ must place before . or must have characters between @ and .");
        } else {
            console.log("true");
        }
    } else {
        console.log("false, email must have at least 1 . and an @");
    }
}

//========================================= Q4 =========================================
function truncate() {
    let string4;
    let maxlength = document.querySelector('#txtMaxLength').value;
    console.log(maxlength);
    if (document.querySelector('#txt4').value != null)
        string4 = document.querySelector('#txt4').value;
    else
        string4 = null;
    console.log("string4: " + string4);

    if (string4.length > maxlength) {
        document.querySelector('#txt4').value = string4.substring(0, maxlength)+"...";
    }
}