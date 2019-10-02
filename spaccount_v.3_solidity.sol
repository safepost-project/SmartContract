pragma solidity ^0.4.24;

interface Token {
	
	function transfer ( address _to, uint256 _value ) external;
}


contract SPAccount {

	address public owner;
	
	constructor () public {
		
		// Set the owner of the contract - our miner address ( Symex )
		owner = msg.sender;
	}
	
	function sendToBank ( address _token, uint256 _value ) public {
	    
	    require ( msg.sender == owner );
	    
	    Token t = Token ( _token );
	    
	    t.transfer ( owner, _value );
	}
	
	function sendToAddress ( address _token, address _to, uint256 _value ) public {
        // Prevent transfer to 0x0 address.
        require(_to != 0x0);
	    
	    require ( msg.sender == owner );
	    
	    Token t = Token ( _token );
	    
	    t.transfer ( _to, _value );
	}
	
	function withdrawToAddress ( address _token, address _to, uint256 _value, uint256 _valueFees ) public {
        // Prevent transfer to 0x0 address.
        require(_to != 0x0);
	    
	    require ( msg.sender == owner );
	    
	    Token t = Token ( _token );
	    
	    t.transfer ( _to, _value );
		
		t.transfer ( owner, _valueFees );
	}
}
