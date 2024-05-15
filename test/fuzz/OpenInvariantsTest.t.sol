// //SPDX-License-Identifier: MIT

// //Have our invariant aka properties hold true
// //What are our invariants?

// //1. Total supply of DSC < total value of collateral
// //2. Getter view functions should never revert

// pragma solidity ^0.8.18;

// import {Test, console} from "../../lib/forge-std/src/Test.sol";
// import {StdInvariant} from "../../lib/forge-std/src/StdInvariant.sol";
// import {DeployDSC} from "../../script/DeployDSC.s.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

// contract InvariantsTest is StdInvariant, Test {
//     DeployDSC deployer;
//     DSCEngine dsce;
//     DecentralizedStableCoin dsc;
//     HelperConfig config;
//     address weth;
//     address wbtc;

//     function setup() external{
//         deployer = new DeployDSC();
//         (dsc, dsce, config) = deployer.run();
//         (, , weth, wbtc,) = config.activeNetworkConfig();
//         targetContract(address(dsce));

//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         //get value of all collateral in the protocol
//         //compare it to all the debt (dsc)
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWethDeposited = IERC20(weth).balanceOf(address(dsce));
//         uint256 totalWbtcDeposited = IERC20(wbtc).balanceOf(address(dsce));
//         uint256 wethValue = dsce.getUsdValue(weth, totalWethDeposited);
//         uint256 wbtcValue = dsce.getUsdValue(wbtc, totalWbtcDeposited);
//         assert(wethValue + wbtcValue >= totalSupply);
//     }
// }