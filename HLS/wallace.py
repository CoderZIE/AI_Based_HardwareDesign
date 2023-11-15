from myhdl import block, always_comb, Signal, intbv, toVerilog

@block
def AdderSubtractor(A, B, Sum, Difference, CarryOut, BorrowOut):
    """4-bit adder-subtractor with carry/borrow out."""
    
    @always_comb
    def adder_subtractor_logic():
        Sum.next = A + B
        Difference.next = A - B
        CarryOut.next = A & B  # Use bitwise AND
        BorrowOut.next = A < B
    
    return adder_subtractor_logic

@block
def Multiplier(A, B, Product):
    """4-bit multiplier."""
    
    @always_comb
    def multiplier_logic():
        Product.next = A * B
    
    return multiplier_logic

if __name__ == "__main__":
    A, B, Sum, Difference, CarryOut, BorrowOut, Product = [Signal(intbv(0)[4:]) for _ in range(7)]
    
    # Instantiate adder-subtractor and multiplier blocks
    adder_subtractor_inst = AdderSubtractor(A, B, Sum, Difference, CarryOut, BorrowOut)
    multiplier_inst = Multiplier(A, B, Product)
    
    # Convert both blocks to Verilog
    adder_subtractor_inst.convert(hdl="Verilog")
    multiplier_inst.convert(hdl="Verilog")
