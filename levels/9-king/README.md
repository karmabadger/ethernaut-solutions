# King

### upgrated to solidity v0.8.11

## instructions

1. deploy King contract (using the original king address)
2. deploy Attack contract
3. call attack with King contract address

note:
attack is using `payable(_kingContract).call{value: msg.value}("")` bc send and transfer do not work.
