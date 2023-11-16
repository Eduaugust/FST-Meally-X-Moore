# State Machine in VHDL
This repository contains the implementation of a State Machine in VHDL. The state machine is implemented using the Moore model and will also be implemented using the Mealy model.

The state machine aims to produce an output of '1' only when it receives two consecutive '1's at the input. For this, the machine has three states:

State A: initial state, where we have not yet received any '1'.
State B: state where we have received one '1', but have not yet received the second '1'.
State C: state where we have received two consecutive '1's.
The transition between states is controlled by a clock and a reset signal. The output of the machine is updated at each state transition.