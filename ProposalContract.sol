// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {

    address owner;

    struct Proposal {
        string description; // Description of the proposal
        uint256 approve; // Number of approve votes
        uint256 reject; // Number of reject votes
        uint256 pass; // Number of pass votes
        uint256 total_vote_to_end; // When the total votes in the proposal reaches this limit, proposal ends
        bool current_state; // This shows the current state of the proposal, meaning whether if passes of fails
        bool is_active; // This shows if others can vote to our contract
    }
    mapping(uint256 => Proposal) proposal_history; // Recordings of previous proposals

    Proposal proposal;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can increment or decrement the counter");
        _;
    }

    constructor( string memory description, uint256 approve,uint256 reject,uint256 pass,uint256 total_vote_to_end, bool current_state, bool is_active) {
        owner = msg.sender;
        proposal = Proposal(description, approve, reject, pass, total_vote_to_end, current_state, is_active);
        proposal.description = "hello There!";
        proposal.total_vote_to_end = approve + reject + pass;

    }

    function increment_approve() external{
        proposal.approve += 1;
    }

    function increment_reject() external{
        proposal.reject += 1;
    }
    function increment_pass() external{
        proposal.pass += 1;
    }


    function get_current_state() public view{
        if(proposal.total_vote_to_end >= 10) {
            bool current_state = true;
        }
    }

    function get_current_state_value() external view returns(bool) {
        return proposal.current_state;
    }

    function get_approval_value() external view returns(uint256) {
        return proposal.approve;
    }
    function get_reject_value() external view returns(uint256) {
        return proposal.reject;
    }
    function get_pass_value() external view returns(uint256) {
        return proposal.pass;
    }

    function get_description_value() external view returns(string memory) {
        return proposal.description;
    }

}