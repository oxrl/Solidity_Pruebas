pragma solidity ^0.4.23;

contract ejemplo3 {
/*
    string  fname ;
    uint    fid;
    bool fisPerson;
    address owner;
*/
    struct Person{
      uint id;
      string name;
      bool isPerson;
    }
    mapping(address => Person) empleados;
    address Owner;

    constructor () public {
        Owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == Owner);
        _;
    }

    event Detailer(
         string name,
         uint id,
         address direccion
        );


    function setDets (string _fname,uint _id, address _a) onlyOwner public {
        empleados[_a] = Person(_id, _fname, true);
      /*  p[_a].id   = _id;
        p[_a].name = _fname;
        p[_a].isPerson = true;*/
        emit Detailer(_fname,_id, _a);
    }

    function getDets (address _a) public constant returns (string,uint,address) {
        Person storage p = empleados[_a];
        return (p.name,p.id,_a);
    }
}
