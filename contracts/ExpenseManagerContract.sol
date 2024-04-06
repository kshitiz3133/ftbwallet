// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ExpenseManagerContract {
    struct Transaction {
        address user;
        uint amount;
        string reason;
        uint timestamp;
    }

    Transaction[] public transactions;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    mapping(address => uint) public balances;

    event Deposit(address indexed _from, uint _amount, string _reason, uint timestamp);
    event Withdraw(address indexed _to, uint _amount, string _reason, uint timestamp);

    function deposit(uint _amount, string memory _reason) public payable {
        require(_amount > 0, "Deposit amount should be greater than 0");
        balances[msg.sender] += _amount;
        transactions.push(Transaction(msg.sender, _amount, _reason, block.timestamp));
        emit Deposit(msg.sender, _amount, _reason, block.timestamp);
    }

    function withdraw(uint _amount, string memory _reason) public {
        require(balances[msg.sender] >= _amount, "Insufficient fund");
        balances[msg.sender] -= _amount;
        transactions.push(Transaction(msg.sender, _amount, _reason, block.timestamp));
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount, _reason, block.timestamp);
    }

    function getBalance(address _account) public view returns (uint) {
        return balances[_account];
    }

    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }

    function getTransactions(uint _index) public view returns (address, uint, string memory, uint)  {
        require(_index < transactions.length, "Index out of bound");
        Transaction memory transaction = transactions[_index];
        return (transaction.user, transaction.amount, transaction.reason, transaction.timestamp);
    }

    function getAllTransaction() public view returns (address[] memory, uint[] memory, string[] memory, uint[] memory)  {
        address[] memory users = new address[](transactions.length);
        uint[] memory amounts = new uint[](transactions.length);
        string[] memory reasons = new string[](transactions.length);
        uint[] memory timestamps = new uint[](transactions.length);

        for (uint i = 0; i < transactions.length; i++) {
            Transaction memory transaction = transactions[i];
            users[i] = transaction.user;
            amounts[i] = transaction.amount;
            reasons[i] = transaction.reason;
            timestamps[i] = transaction.timestamp;
        }
        return (users, amounts, reasons, timestamps);
    }

    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}
