const ExpenseManagerContract = artifacts.require("ExpenseManagerContract");
module.exports=function(deploer){
    deploer.deploy(ExpenseManagerContract);
};