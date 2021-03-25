// SPDX-License-Identifier: MIT

//pragma solidity ^0.4.25;
//0.8.0 开始，算术运算有两个计算模式：一个是 “wrapping”（截断）模式或称 “unchecked”（不检查）模式，一个是”checked” 
//（检查）模式。 默认情况下，算术运算在 “checked” 模式下，即都会进行溢出检查，如果结果落在取值范围之外，调用会通过失败
//异常<assert-and-require>回退。可以通过 unchecked { … }切换到 “unchecked”模式。一般来说，我们都要注意这个问题，保证数据不溢出。
pragma solidity >=0.8.0 <0.9.0;
// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is no longer needed starting with Solidity 0.8. The compiler
 * now has built in overflow checking.
 */
library SafeMath {
  
    //wrapping unchecked
    function tryAdd(uint256 a,uint256 b) internal pure returns(bool,uint256){
        unchecked {
            uint256 c=a+b;
            if(c<a) return(false,0);
            return(true,c);
        }
        
    }
    
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
       unchecked{
           if(b>a) return(false,0);
           return(true,a-b);
       }
    }
    
    function tryMul(uint256 a,uint256 b) internal pure returns(bool,uint256){
        unchecked{
            if(a==0) return(true,0);
            uint256 c=a*b;
            if(c/a!=b) return(false,0);
            return(true,c);
        }
        
    }
    
    function tryDiv(uint256 a,uint256 b) internal pure returns(bool,uint256){
        unchecked{
            if(b==0) return(false,0);
            return(true,a/b);
        }
    }
    
    function tryMod(uint256 a,uint256 b) internal pure returns(bool,uint256){
        unchecked {
            if(b==0) return(false,0);
            return(true,a%b);
        }
    }




    //message unnecessarily. For custom revert reasons use {trySub}
    //函数名可以重名，参数数量、类型不一致即可
    function messub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }
    
    
    function mesdiv(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }
    
    
    function mesmod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }






    // v0.8.0 built in overflow checks
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }
    
     function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }
    
     function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }
}


    

contract Main{
    
    function testtryAdd() public pure returns(uint256){
        uint256 a;
        bool bol;
        (bol,a)=SafeMath.tryAdd(10,20);
        return a;
    }
    
     function testAdd() public pure returns(uint256){
        uint256 a;
        a=SafeMath.add(10,30);
        return a;
    }
    
    
     function testtrySub() public pure returns(uint256,bool){
        uint256 a;
        bool bol;
        (bol,a)=SafeMath.trySub(10,20);
        return (a,bol);
    }
    
    
     function testSub() public pure returns(uint256){
        
        uint a=SafeMath.sub(9,10);
        //uint b=SafeMath.sub(22,20,"b>a");
        //return (a,b);
        return a;
    }
    
    
    
}
