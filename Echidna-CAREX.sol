// SPDX-License-Identifier: BSD-4-Clause
pragma solidity ^0.8.1;

import "ABDKMath64x64.sol";

contract Test {
   int128 internal zero = ABDKMath64x64.fromInt(0);
   int128 internal one = ABDKMath64x64.fromInt(1);

   event Value(string, int64);
   function debug(string calldata x, int128 y) public {
     emit Value(x, ABDKMath64x64.toInt(y));
   }
 
   function add(int128 x, int128 y) public returns (int128) {
     return ABDKMath64x64.add(x, y);
   }
 
   function sub(int128 x, int128 y) public returns (int128) {
     return ABDKMath64x64.sub(x, y);
   }

   function mul(int128 x, int128 y) public returns (int128) {
     return ABDKMath64x64.mul(x, y);
   }

   function muli(int128 x, int256 y) public returns (int256) {
     return ABDKMath64x64.muli(x, y);
   }

   function mulu(int128 x, uint256 y) public returns (uint256) {
     return ABDKMath64x64.mulu(x, y);
   }

   function div(int128 x, int128 y) public returns (int128) {
     return ABDKMath64x64.div(x, y);
   }

   function divi(int256 x, int256 y) public returns (int128) {
     return ABDKMath64x64.divi(x, y);
   }

   function divu(uint256 x, uint256 y) public returns (int128) {
     return ABDKMath64x64.divu(x, y);
   }

   function fromInt(int256 x) public returns (int128) {
     return ABDKMath64x64.fromInt(x);
   }

   function fromUInt(uint256 x) public returns (int128) {
     return ABDKMath64x64.fromUInt(x);
   }

   function pow(int128 x, uint256 y) public returns (int128) {
     return ABDKMath64x64.pow(x, y);
   }

   function neg(int128 x) public returns (int128) {
     return ABDKMath64x64.neg(x);
   }

   function abs(int128 x) public returns (int128) {
     return ABDKMath64x64.abs(x);
   }

   function inv(int128 x) public returns (int128) {
     return ABDKMath64x64.inv(x);
   }

   function avg(int128 x, int128 y) public returns (int128) {
     return ABDKMath64x64.avg(x, y);
   }

   function gavg(int128 x, int128 y) public returns (int128) {
     return ABDKMath64x64.gavg(x, y);
   }

   function sqrt(int128 x) public returns (int128) {
     return ABDKMath64x64.sqrt(x);
   }

   function log_2(int128 x) public returns (int128) {
     return ABDKMath64x64.log_2(x);
   }

   function ln(int128 x) public returns (int128) {
     return ABDKMath64x64.ln(x);
   }

   function exp_2(int128 x) public returns (int128) {
     return ABDKMath64x64.exp_2(x);
   }

   function exp(int128 x) public returns (int128) {
     return ABDKMath64x64.exp(x);
   }

  /**
   * Test associative property of addition (x + y) + z = x + (y + z).
   */
   function testAddAssociative(int128 x, int128 y, int128 z) public {
     assert(add(add(x, y), z) == add(x, add(y, z)));
   }

  /**
   * Test commutative property of addition x + y = y + x.
   */
   function testAddCommutative(int128 x, int128 y) public {
     assert(add(x, y) == add(y, x));
   }

  /**
   * Test identity property of addition x + 0 = x.
   */
   function testAddIdentity(int128 x) public {
     assert(add(zero, x) == x);
   }

  /**
   * Test associative property of multiplication (x * y) * z = x * (y * z).
   */
   function testMulAssociative(int128 x, int128 y, int128 z) public {
     assert(mul(mul(x, y), z) == mul(x, mul(y, z)));
   }

   function testMuliAssociative(int128 x, int256 y, int256 z) public {
     assert(muli(fromInt(z), muli(x, fromInt(y))) == muli(x, muli(fromInt(y), fromInt(z))));
   }

  /**
   * Test commutative property of multiplication x * y = y * x.
   */
   function testMulCommutative(int128 x, int128 y) public {
     assert(mul(x, y) == mul(y, x));
   }
   function testMuliCommutative(int128 x, int128 y) public {
     assert(muli(x, int256(y)) == muli(y, int256(x)));
   }

  /**
   * Test identity property of multiplication x * 1 = x.
   */
   function testMulIdentity(int128 x) public {
     assert(mul(one, x) == x);
   }

   function testMuliIdentity(int256 x) public {
     assert(muli(one, x) == x);
   }

   function testMulIdentity(uint256 x) public {
     assert(mulu(one, x) == x);
   }

  /**
   * Test commutative property of substraction x - y != y - x (for all x != y).
   */
   function testSubCommutative(int128 x, int128 y) public {
     if(x == y){
      assert(sub(x, y) == sub(y, x));
     }
     else{
      assert(sub(x, y) != sub(y, x));
     }
   }

  /**
   * Test commutative property of abs substraction abs(x - y) = abs(y - x).
   */
   function testAbsSubCommutative(int128 x, int128 y) public {
     assert(abs(sub(x, y)) == abs(sub(y, x)));
   }

  /**
   * Test zero property of substraction x - 0 = x.
   */
   function testSubZero(int128 x) public {
     assert(sub(x, zero) == x);
   }

  /**
   * Test self substraction x - x = 0.
   */
   function testSubSelf(int128 x) public {
     assert(sub(x, x) == zero);
   }

  /**
   * Test zero division 0 / x = 0 (for all x != 0).
   */
   function testDivZero(int128 x) public {
     if(x != zero){
      assert(div(zero, x) == zero);
     }
   }

   function testDiviZero(int256 x) public {
     if(x != zero){
      assert(divi(zero, x) == zero);
     }
   }

  /**
   * Test self division x / x = 1 (for all x != 0).
   */
   function testDivSelf(int128 x) public {
     if(x != zero){
      assert(div(x, x) == one);
     }
   }
   function testDiviSelf(int256 x) public {
     if(x != zero){
      assert(divi(x, x) == one);
     }
   }

  /**
   * Test neg of x.
   */
   function testNeg(int128 x) public {
     assert(neg(x) == sub(0, x));
   }

  /**
   * Test abs of x.
   */
   function testAbs(int128 x) public {
     assert(abs(x) == abs(neg(x)));
   }

  /**
   * Test inverse of x (for all x != 0).
   */
   function testInv(int128 x) public {
     if(x != zero){
      if(abs(x) > one){
        assert(abs(inv(x)) < one);
      }
      else if(x < one){
        assert(abs(inv(x)) > one);
      }
      else{
        assert(abs(inv(x)) == one);
      }
     }
   }

  /**
   * Test pow (multiplication of powers with the same base) x^y * x^z = x^(y + z).
   */
   function testPow(int128 x, uint256 y, uint256 z) public {
     assert(mul(pow(x, y), pow(x, z)) == pow(x, (y + z)));
   }

  /**
   * Test avg commutative property.
   */
   function testAvg(int128 x, int128 y) public {
     assert(avg(x, y) == avg(y, x));
   }

  /**
   * Test geometric avg commutative property.
   */
   function testGavg(int128 x, int128 y) public {
     assert(gavg(x, y) == gavg(y, x));
   }

  /**
   * Test sqrt product property.
   */
   function testSqrt (int128 x, int128 y) public {
     assert(mul(sqrt(x), sqrt(y)) == sqrt(mul(x, y)));
   }

  /**
   * Test log_2 product property => log_2(x*y) = log_2(x) + log_2(y.
   */
   function testLog2Product (int128 x, int128 y) public {
     assert(log_2(mul(x, y)) == add(log_2(x), log_2(y)));
   }

  /**
   * Test log_2 div property => log_2(x/y) = log_2(x) - log_2(y).
   */
   function testLog2Div (int128 x, int128 y) public {
     if(y != 0){
      assert(log_2(div(x, y)) == sub(log_2(x), log_2(y)));
     }
   }

  /**
   * Test log_2 power property => log_2(x^y) = y * log_2(x).
   */
   function testLog2Power (int128 x, int128 y) public {
     assert(log_2(pow(x, uint256((int256 (y))))) == mul(y, log_2(x)));
   }

  /**
   * Test ln product property => ln(x*y) = ln(x) + ln(y).
   */

   function testLnProduct (int128 x, int128 y) public {
     assert(ln(mul(x, y)) == add(ln(x), ln(y)));
   }

  /**
   * Test ln div property => ln(x/y) = ln(x) - ln(y).
   */
   function testLnDiv (int128 x, int128 y) public {
     if(y != 0){
      assert(ln(div(x, y)) == sub(ln(x), ln(y)));
     }
   }

  /**
   * Test ln power property =>  ln(x^y) = y * ln(x).
   */
   function testLnPower (int128 x, int128 y) public {
    assert(ln(pow(x, uint256((int256 (y))))) == mul(y, ln(x)));
   }

  /**
   * Test exp_2.
   */
   function testExp2 (int128 x, int128 y) public {
     assert(mul(exp_2(x), exp_2(y)) == exp_2((x + y)));
   }

  /**
   * Test exp.
   */
   function testExp (int128 x, int128 y) public {
     assert(mul(exp(x), exp(y)) == exp((x + y)));
   }

}
