    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.17;

    import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
    import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
    import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
    import "@openzeppelin/contracts-upgradeable/OwnableUpgradeable.sol";

    contract LW3NFT is 
        Initializable,
        ERC721Upgradeable,
        UUPSUpgradeable,
        OwnableUpgradeable
    {
        // Note how we created an initialize function and then added the
        // inittializer modifier which ensure that the
        // initialize function is only called once
        function initialize() public inittializer {
            // Note how instead of using the ERC721() constructor, we have to manually initialize it
            // Some goes for the Ownable contract where we have to manually initialize it 
            _ERC721_init("LW3NFT", "LW3NFT");
            _Owmable_init();
            _mint(msg.sender, 1);
        }

        function _authorizedUpgrade(address newImplementation)
            internal
            override
            onlyOwner
        {}


    }
