// SPDX-License-Identifier: MIT-open-group
pragma solidity >=0.7.4;
pragma experimental ABIEncoderV2;

library StakingStorageLibrary {
    bytes32 constant STORAGE_LOCATION = keccak256("staking.storage");

    struct StakingStorage {
        uint256 minimumStake;   // 1_000_000;
        uint256 majorStakeFine; // 200_000;
        uint256 minorStakeFine; // 50_000;
        uint256 rewardAmount;   // 1_000;
        uint256 rewardBonus;    // 1_000;
    }

    function stakingStorage() internal pure returns (StakingStorage storage sv) {
        bytes32 position = STORAGE_LOCATION;
        assembly { // solium-disable-line
            sv.slot := position // From solidity 0.6 -> 0.7 syntax changes from '_' to '.'
        }
    }

}