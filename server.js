// Got this template from week 12 activity 14
let mysql = require("mysql");
let inquirer = require("inquirer");
let table = require("console.table");

let connection = mysql.createConnection({
  host: "localhost",

  port: 3306,

  user: "root",

  password: "",
  database: "employee"
});

connection.connect(function(err) {
  if (err) throw err;
  start();
});

function start() {
  inquirer
    .prompt({
      name: "Choices",
      type: "list",
      message: "What would you like to search?",
      choices: ["View All Employees", "View All Departments", "Update Roles", "EXIT"]
    })
    .then(function(answer) {
      if (answer.Choices === "View All Employees") {
        viewEmp();
      }
      else if(answer.Choices === "View All Departments") {
        viewDepart();
      } 
      else if (answer.Choices === "Update Roles") {
        updateRole();
      }
      else{
        connection.end();
      }
    });
}
    function viewEmp(){
      connection.query("SELECT * FROM employee_list", function(err,data){
        if (err) throw err;
        console.table(data)
        start()
      })
    }
    function viewDepart(){
      connection.query("SELECT * FROM department", function(err,data){
        if (err) throw err;
        console.table(data)
        start()
      })
    }
    function updateRole(){
      connection.query("SELECT * FROM employee_list", function(err,data){
        if (err) throw err;
        let employee_list = []
        data.forEach(function(employee){
            let employeeObjects = {
            value:employee.id,
            name:employee.first_name + " " + employee.last_name
          }
          employee_list.push(employeeObjects)
        })
        inquirer.prompt({
          name:"employee",
          type:"list",
          message:"Select an employee to update",
          choices:employee_list
        }).then(function(answer){
          connection.query("SELECT * FROM role", function(err,data){
            if (err) throw err;
            let role_list = []
        data.forEach(function(role){
            let roleObjects = {
            value:role.id,
            name:role.title
          }
          role_list.push(roleObjects)
        })
            inquirer.prompt({
            name:"role",
            type:"list",
            message:"What is the new role?",
            choices:role_list
        })
        .then(function(answer2){
            let roleID = answer2.role
            let employeeID = answer.employee
          connection.query("UPDATE employee_list SET role_id = " + roleID + " WHERE id = " + employeeID, function(err,data){
            if (err) throw err;
            console.log("updated role")
            start()
          })
        })
      })
        })
      })
    }
function addEmployee() {
  inquirer
    .prompt([
      {
        name: "new_employee",
        type: "input",
        message: "What is the new employee name?"
      },
      {
        name: "role",
        type: "input",
        message: "What is their role?"
      },
    ])
    .then(function(answer) {
      connection.query(
        "INSERT INTO employee_list SET ?",
        {
          item_name: answer.new_employee,
          category: answer.role,
        },
        function(err) {
          if (err) throw err;
          console.log("Successful addition");
          start();
        }
      );
    });
}