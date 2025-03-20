pragma solidity ^0.8.0;

contract PerformanceData {
    struct UserPerformance {
        uint256 totalTasks;
        uint256 completedTasks;
        uint256 score;
    }

    mapping(address => UserPerformance) private performanceRecords;
    
    function updatePerformance(uint256 _totalTasks, uint256 _completedTasks, uint256 _score) public {
        performanceRecords[msg.sender] = UserPerformance(_totalTasks, _completedTasks, _score);
    }

    function getPerformance() public view returns (uint256, uint256, uint256) {
        UserPerformance storage data = performanceRecords[msg.sender];
        return (data.totalTasks, data.completedTasks, data.score);
    }
}
