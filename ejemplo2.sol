pragma solidity ^0.4.23;

contract ejemplo2 {

    string  fname ;
    uint    fid;
    bool fisPerson;
    address owner;
/*
    struct Person{
      uint id;
      bytes32 name;
      bool isPerson;
    }
*/
    constructor () public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    event Detailer(
         string name,
         uint id,
         bool isPerson
        );


    function setDets (string _fname,uint _id) onlyOwner public {
        fname = _fname;
        fid = _id;
        fisPerson = true;
        emit Detailer(_fname,_id, fisPerson);
    }

    function getDets (address _a) public constant returns (string,uint,bool) {
        Campaign storage c = campaigns[campaignID];
        return (fname,fid,fisPerson);
    }
}
