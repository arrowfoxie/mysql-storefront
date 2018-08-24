var mysql = require("mysql");
var inquirer = require("inquirer");

// create the connection information for the sql database
var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "root",
    database: "bamazon"
});

// connects to the mysql server and sql database
connection.connect(function (err) {
    if (err) throw err;
    connection.query('SELECT * FROM `products`', function (err, res)
{ 
    for (var item of res){
        console.log(item.product_name, item.price, item.item_id);
    }

    // run the start function after the connection is made to prompt the user
    start();
})
});

function start() {

    inquirer
        .prompt([{
            name: "itemId",
            type: "input",
            message: "What is the item ID you would like to buy?",
            validate: function (value) {
                if (isNaN(value) == false) {
                    return true;
                } else {
                    return false;
                }
            }
        }, {
            name: "quantity",
            type: "input",
            message: "How many of this item would you like to buy?",
            validate: function (value) {
                if (isNaN(value) == false) {
                    return true;
                } else {
                    return false;
                }
            }
        }])
        .then(function (answer) {
            var iD = answer.itemId;
            var amount = answer.quantity;
            connection.query('SELECT * FROM `products` WHERE `item_id` = ?', [iD], function (err, res) {
                if (res.length === 0) {
                    console.log("The store is closed");
                    start(); 
                    return err;
                }
                var stock = res[0].stock_quantity;
                var product = res[0].product_name;
                var price = res[0].price;
                var remaining = stock - amount;

                if (remaining >= 0) {
                    // updating database
                    connection.query("UPDATE `products` SET ? WHERE ?", [{
                        stock_quantity: remaining
                    }, {
                        item_id: iD
                    }], function (error, response) {
                        // error handling
                        console.log("you have purchased " + amount + " of " + product + " for $" + (price * amount));
                        start();
                    });
                } else {
                    // none available
                    if (stock === 0){
                        console.log("There's no more");
                    } else {
                    console.log("There's only " + stock + " left");
                }
                start();
                }
              
            });

        })
};  
