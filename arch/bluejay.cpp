//==============================================
// include 
//==============================================
#include <iostream>

//==============================================
// define 
//==============================================
#define MEMORY__SIZE 1024 

//==============================================
// Bluejay 
//==============================================
class Bluejay
{
public:
    uint64_t x[32];
    uint8_t memory[MEMORY__SIZE];

    // program counter
    uint64_t pc;
    // instruction register
    uint64_t ir;

    Bluejay();
    void Run();
    uint64_t Load(uint64_t addr, uint8_t size);
    uint64_t Field(uint64_t data, uint64_t lsb, uint64_t width);

};

//==============================================
// Bluejay (Constructor)
//==============================================
Bluejay::Bluejay()
{
    std::cout << "Bluejay\n";
    
    memory[0] = 0xff;
    memory[1] = 0xee;
    memory[2] = 0xdd;
    memory[3] = 0xcc;
    memory[4] = 0xbb;
    memory[5] = 0xaa;
    memory[6] = 0x99;
    memory[7] = 0x88;
    memory[8] = 0x77;
    memory[9] = 0x66;
    memory[10] = 0x55;
    memory[11] = 0x44;
    memory[12] = 0x33;
    memory[13] = 0x22;
    memory[14] = 0x11;
    memory[15] = 0x00;
}

#define IR__OPCODE__LSB 0
#define IR__OPCODE__WIDTH 7
#define IR__RD__LSB 7
#define IR__RD__WIDTH 5
#define IR__FUNCT3__LSB 12
#define IR__FUNCT3__WIDTH 3
#define IR__RS1__LSB 15
#define IR__RS1__WIDTH 5
#define IR__RS2__LSB 20
#define IR__RS2__WIDTH 5
#define IR__FUNCT3__LSB 25
#define IR__FUNCT3__WIDTH 7 


//==============================================
// Field 
//==============================================
uint64_t Bluejay::Field(uint64_t data, uint64_t lsb, uint64_t width)
{
    return (data >> lsb) & (0xffffffffffffffff >> (64 - width));
}

//==============================================
// Run 
//==============================================
void Bluejay::Run()
{
    std::cout << "Run\n";

    uint64_t opcode;
    uint64_t rd;
    uint64_t funct3;
    uint64_t rs1;
    uint64_t rs2;
    uint64_t funct7;
    uint64_t imm;


    while (1) {
        // load instruction      
        ir = Load(pc, 4);
        std::cout << "pc: " << std::hex << pc << std::endl; 
        std::cout << "ir: " << std::hex << ir << std::endl; 

        opcode = Field(ir, IR__OPCODE__LSB, IR__OPCODE__WIDTH);
        rd = Field(ir, IR__RD__LSB, IR__RD__WIDTH);
        funct3 = Field(ir, IR__FUNCT3__LSB, IR__FUNCT3__WIDTH);
        rs1 = Field(ir, IR__RS1__LSB, IR__RS1__WIDTH);
        rs2 = Field(ir, IR__RS2__LSB, IR__RS2__WIDTH);
        funct7 = Field(ir, IR__FUNCT7__LSB, IR__FUNCT7__WIDTH);
                
        std::cout << "opcode: " << std::hex << opcode << std::endl; 
        std::cout << "rd: " << std::hex << rd << std::endl; 
        std::cout << "funct3: " << std::hex << funct3 << std::endl; 
        std::cout << "rs1: " << std::hex << rs1 << std::endl; 
        std::cout << "rs2: " << std::hex << rs2 << std::endl; 
        std::cout << "funct7: " << std::hex << funct7 << std::endl; 

        switch (opcode)
        {
            0x03:
                switch (funct3)
                {
                    // lb
                    0x0:
                        break;
                    // lh
                    0x1:
                        break;
                    // lw
                    0x2:
                        break;
                    // ld
                    0x3:
                        break;
                    // lbu
                    0x4:
                        break;
                    // lhu 
                    0x5:
                        break;
                    // lwu 
                    0x6:
                        break;
                    default:
                }
                break;
            0x0f:
                switch (funct3)
                {
                    // fence
                    0x0:
                        break;
                    // fence.i
                    0x1:
                        break;
                    default:
                }
                break;
            0x13:
                switch (funct3)
                {
                    // addi
                    0x0:
                        break;
                    0x1:
                        switch (funct7)
                        {
                            // slli
                            0x0:
                                break; 
                            default:
                        }
                    // slti
                    0x2:
                        break;
                    // sltiu
                    0x3:
                        break;
                    // xori
                    0x4:
                        break;
                    0x5:
                        switch (funct7)
                        {
                            // srli
                            0x00:
                                break;
                            // srai
                            0x20:
                                break;
                            default:
                        }
                    // ori
                    0x6:
                        break;
                    // andi 
                    0x7:
                        break;
                    default:
                }
            // auipc
            0x17:
                break;
            0x1b:
                switch (funct3)
                {
                    // addiw
                    0x0:
                        break;
                }
                
            default: 
        }
        



        break;
    }

}

//==============================================
// Load 
//==============================================
uint64_t Bluejay::Load(uint64_t addr, uint8_t size)
{
    uint64_t data = 0;

    for (int i = 0; i < size; i++) 
    {
        data |= (uint64_t)memory[addr + i] << (8*i);
    } 

    return data;
}

//==============================================
// main
//==============================================
int main()
{
    std::cout << "Hello World!\n";
    Bluejay bluejay;
    bluejay.Run();
//    uint64_t data;
//    data = bluejay.Load(1, 8);
//    std::cout << std::hex << data << std::endl;
    return 0; 
}
