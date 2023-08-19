pragma solidity >=0.5.0;

/**
    This smart contract demo the ability to use ML/AI inference directly on-chain using NATIVE SMART CONTRACT CAll
 */
contract VannaDemo {
    //Our demo is aiming to show you the potential use case of ML inference on-chain. In this demo, 
    // we will inference a volatility forecasting model
    uint volatility;
    constructor(){
        volatility = 0;
    }
   
    /**
    @dev This function allows us to set the volatility from the ML forecast model directly 
         by calling native inferCall function
    **/
    function setVolatility(string memory input) public {
        //Make a inference call to the volatility forecast model with given input. 
        bytes32 returnData = inferCall(abi.encodePacked(input));
        //After calling the inference call, we set the volatility in the smart contract.
        //Which can be use repeatedly in different scenario, such as deciding transaction fee in Uniswap.
        volatility = uint256(returnData);
    }
    /**
    @dev Get volatility to see the value, the volatility is in the unit of wei to support floating point calculation
    **/
    function getVolatility() public view returns (uint256) {
        return volatility;
    }


}