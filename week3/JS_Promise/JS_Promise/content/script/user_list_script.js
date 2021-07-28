function showData() {
    let city = document.querySelector("#txtCity").value;
    let url = `${"https://jsonmock.hackerrank.com/api/food_outlets?city=" + city}`;
    console.log(url);
    let f = fetch(url).then(function (response) {
        return response.json();
    }).then(function (d) {
        let tbody = document.querySelector("tbody");
        tbody.innerHTML = "";
        let x = d.data.length;
        for (let i = 0; i < x; i++) {
            let tableRow = `<tr>
                                <td>${d.data[i].id}</td>
                                <td>${d.data[i].name}</td>
                                <td>${d.data[i].city}</td>
                                <td>${d.data[i].estimated_cost}</td>
                                <td>${d.data[i].user_rating.average_rating}</td>
                                <td>${d.data[i].user_rating.votes}</td>
                            </tr>`
            tbody.innerHTML = tbody.innerHTML + tableRow;
        }
    })
}