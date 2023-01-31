const { expect } = require("chai");
const { ethers } = require("hardhat");
const hre = require("hardhat");

describe("ERC721 Upgradeable", function () {
    it("Should deploy an upgradeable ERC721 Contract", async function () {
        const LW3NFT = await ethers.getContractFactory("LW3NFT");
        const LW3NFT2 = await ethers.getContractFactory("LW3NFT2");

        // Deploy LW3NFT as a UUPS Proxy Contract
        let proxyConnect = await hre.upgrades.deployProxy(LW3NFT, {
            kind: "uups",
        });
        const [owner] = await ethers.getSigners();
        const ownerOfToken1 = await proxyConnect.ownerOf(1);

        expect(ownerOfToken1).to.equal(owner.address);

        // Deploy LW3NFT2 as an upgrade to LW3NFT
        proxyConnect = await hre.upgrades.upgradeProxy(proxyConnect, LW3NFT2);
        // Verify it has been upgraded
        expect(await proxyConnect.test()).to.equal("upgraded");
    });
});
