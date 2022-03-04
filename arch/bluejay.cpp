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
    uint8_t mem[MEMORY__SIZE];

    // program counter
    uint64_t pc;
    // instruction register
    uint64_t ir;

    Bluejay();
    void Run();
    uint64_t Load(uint64_t addr, uint8_t size);
    void Store(uint64_t data, uint64_t addr, uint8_t size);
    uint64_t Field(uint64_t data, uint64_t lsb, uint64_t width);
    uint64_t SignExtend(uint64_t data, uint64_t width);

};


//==============================================
// Bluejay (Constructor)
//==============================================
Bluejay::Bluejay()
{
    std::cout << "Bluejay\n";
    
    mem[0] = 0xff;
    mem[1] = 0xee;
    mem[2] = 0xdd;
    mem[3] = 0xcc;
    mem[4] = 0xbb;
    mem[5] = 0xaa;
    mem[6] = 0x99;
    mem[7] = 0x88;
    mem[8] = 0x77;
    mem[9] = 0x66;
    mem[10] = 0x55;
    mem[11] = 0x44;
    mem[12] = 0x33;
    mem[13] = 0x22;
    mem[14] = 0x11;
    mem[15] = 0x00;
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
#define IR__FUNCT7__LSB 25
#define IR__FUNCT7__WIDTH 7 


//==============================================
// Field 
//==============================================
uint64_t Bluejay::Field(uint64_t data, uint64_t lsb, uint64_t width)
{
    return (data >> lsb) & (0xffffffffffffffff >> (64 - width));
}

//==============================================
// SignExtend
//==============================================
uint64_t Bluejay::SignExtend(uint64_t data, uint64_t width)
{
    if ((data >> (width - 1)) & 0x1) return data | (0xffffffffffffffff << width);
    else return data & (0xffffffffffffffff >> (64 - width));
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
    uint64_t imm__i_type;
    uint64_t imm__s_type;
    uint64_t imm__b_type;
    uint64_t imm__u_type;
    uint64_t imm__j_type;

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
        imm__i_type = SignExtend(Field(ir, 20, 12), 12);
        imm__s_type = SignExtend((Field(ir, 25, 7) << 5) | Field(ir, 7, 5), 12);
        imm__b_type = SignExtend((Field(ir, 31, 1) << 12) | (Field(ir, 7, 1) << 11) | (Field(ir, 25, 6) << 5) | (Field(ir, 8, 4) << 1), 13);
        imm__u_type = SignExtend(Field(ir, 12, 20) << 12, 32);
        imm__j_type = SignExtend((Field(ir, 31, 1) << 20) | (Field(ir, 12, 8) << 12) | (Field(ir, 20, 1) << 11) | (Field(ir, 21, 10) << 1), 21);
                
        std::cout << "opcode: " << std::hex << opcode << std::endl; 
        std::cout << "rd: " << std::hex << rd << std::endl; 
        std::cout << "funct3: " << std::hex << funct3 << std::endl; 
        std::cout << "rs1: " << std::hex << rs1 << std::endl; 
        std::cout << "rs2: " << std::hex << rs2 << std::endl; 
        std::cout << "funct7: " << std::hex << funct7 << std::endl; 

        uint64_t addr;
        uint64_t data;


        switch (opcode)
        {
            case 0x03:
                switch (funct3)
                {
                    // lb
                    case 0x0:
                        x[rd] = SignExtend(Load(x[rs1] + imm__i_type, 1), 8);
                        pc += 4;
                        break;
                    // lh
                    case 0x1:
                        x[rd] = SignExtend(Load(x[rs1] + imm__i_type, 2), 16);
                        pc += 4;
                        break;
                    // lw
                    case 0x2:
                        x[rd] = SignExtend(Load(x[rs1] + imm__i_type, 4), 32);
                        pc += 4;
                        break;
                    // ld
                    case 0x3:
                        x[rd] = Load(x[rs1] + imm__i_type, 8);
                        pc += 4;
                        break;
                    // lbu
                    case 0x4:
                        x[rd] = Load(x[rs1] + imm__i_type, 1);
                        pc += 4;
                        break;
                    // lhu 
                    case 0x5:
                        x[rd] = Load(x[rs1] + imm__i_type, 2);
                        pc += 4;
                        break;
                    // lwu 
                    case 0x6:
                        x[rd] = Load(x[rs1] + imm__i_type, 4);
                        pc += 4;
                        break;
                }
                break;
            case 0x0f:
                switch (funct3)
                {
                    // fence
                    case 0x0:
                        break;
                    // fence.i
                    case 0x1:
                        break;
                }
                break;
            case 0x13:
                switch (funct3)
                {
                    // addi
                    case 0x0:
                        x[rd] = x[rs1] + imm__i_type;
                        pc += 4;
                        break;
                    case 0x1:
                        switch (funct7)
                        {
                            // slli
                            case 0x0:
                                x[rd] = x[rs1] << (imm__i_type & 0x1f);
                                pc += 4;
                                break; 
                        }
                        break;
                    // slti
                    case 0x2:
                        x[rd] = (int64_t)x[rs1] < (int64_t)imm__i_type;
                        pc += 4;
                        break;
                    // sltiu
                    case 0x3:
                        x[rd] = x[rs1] < imm__i_type;
                        pc += 4;
                        break;
                    // xori
                    case 0x4:
                        x[rd] = x[rs1] ^ imm__i_type;
                        pc += 4;
                        break;
                    case 0x5:
                        switch (funct7)
                        {
                            // srli
                            case 0x00:
                                x[rd] = x[rs1] >> (imm__i_type & 0x1f);
                                pc += 4;
                                break;
                            // srai
                            case 0x20:
                                x[rd] = (int64_t)x[rs1] >> (imm__i_type & 0x1f);
                                pc += 4;
                                break;
                        }
                        break;
                    // ori
                    case 0x6:
                        x[rd] = x[rs1] | imm__i_type;
                        pc += 4;
                        break;
                    // andi 
                    case 0x7:
                        x[rd] = x[rs1] & imm__i_type;
                        pc += 4;
                        break;
                }
                break;
            // auipc
            case 0x17:
                x[rd] = pc + imm__u_type;
                pc += 4;
                break;
            case 0x1b:
                switch (funct3)
                {
                    // addiw
                    case 0x0:
                        x[rd] = SignExtend(x[rs1] + imm__i_type, 32);
                        pc += 4;
                        break;
                    case 0x1:
                        switch (funct7)
                        {
                            // slliw
                            case 0x00:
                                x[rd] = SignExtend(x[rs1] << (imm__i_type & 0x1f), 32);
                                pc += 4;
                                break; 
                        }
                        break;
                    case 0x5:
                        switch (funct7)
                        {
                            // srliw
                            case 0x00:
                                x[rd] = SignExtend(x[rs1] >> (imm__i_type & 0x1f), 32);
                                pc += 4;
                                break; 
                            // sraiw
                            case 0x20:
                                x[rd] = SignExtend((int64_t)x[rs1] >> (imm__i_type & 0x1f), 32);
                                pc += 4;
                                break; 
                        }
                        break;
                }
                break;
            case 0x23:
                switch (funct3)
                {
                    // sb
                    case 0x0:
                        Store(x[rs2], x[rs1] + imm__b_type, 1);
                        pc += 4;
                        break;
                    // sh
                    case 0x1:
                        Store(x[rs2], x[rs1] + imm__b_type, 2);
                        pc += 4;
                        break;
                    // sw
                    case 0x2:
                        Store(x[rs2], x[rs1] + imm__b_type, 4);
                        pc += 4;
                        break;
                    // sd
                    case 0x3:
                        Store(x[rs2], x[rs1] + imm__b_type, 8);
                        pc += 4;
                        break;
                }
                break;
            case 0x33:
                switch (funct3)
                {
                    case 0x0:
                        switch (funct7)
                        {
                            // add
                            case 0x00:
                                x[rd] = (int64_t)x[rs1] + (int64_t)x[rs2];
                                pc += 4;
                                break;
                            // sub 
                            case 0x20:
                                x[rd] = (int64_t)x[rs1] - (int64_t)x[rs2];
                                pc += 4;
                                break;
                        }
                        break;
                    case 0x1:
                        switch (funct7)
                        {
                            // sll
                            case 0x00:
                                x[rd] = x[rs1] << (x[rs2] & 0x1f);
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x2:
                        switch (funct7)
                        {
                            // slt 
                            case 0x00:
                                x[rd] = (int64_t)x[rs1] < (int64_t)x[rs2];
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x3:
                        switch (funct7)
                        {
                            // sltu 
                            case 0x00:
                                x[rd] = x[rs1] < x[rs2];
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x4:
                        switch (funct7)
                        {
                            // xor 
                            case 0x00:
                                x[rd] = x[rs1] ^ x[rs2];
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x5:
                        switch (funct7)
                        {
                            // srl 
                            case 0x00:
                                x[rd] = x[rs1] >> (x[rs2] & 0x1f);
                                pc += 4;
                                break;
                            // sra 
                            case 0x20:
                                x[rd] = (uint64_t)x[rs1] >> (x[rs2] & 0x1f);
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x6:
                        switch (funct7)
                        {
                            // or 
                            case 0x00:
                                x[rd] = x[rs1] | x[rs2];
                                pc += 4;
                                break;
                        }
                        break;
                    case 0x7:
                        switch (funct7)
                        {
                            // and 
                            case 0x00:
                                x[rd] = x[rs1] & x[rs2];
                                pc += 4;
                                break;
                        }
                        break;
                }
                break;
            // lui 
            case 0x37:
                x[rd] = imm__u_type;
                pc += 4;
                break;
            case 0x3b:
                switch (funct3)
                {
                    case 0x0:
                        switch (funct7)
                        {
                            // addw
                            case 0x00:
                                x[rd] = SignExtend(x[rs1] + x[rs2], 32);
                                pc += 4;
                                break;
                            // subw
                            case 0x20:
                                x[rd] = SignExtend(x[rs1] - x[rs2], 32);
                                pc += 4;
                                break;
                        }
                        break;
                    case 0x1:
                        switch (funct7)
                        {
                            // sllw
                            case 0x00:
                                x[rd] = SignExtend(x[rs1] << (x[rs2] & 0x1f), 32);
                                pc += 4;
                                break;
                        }
                        break;
                    case 0x5:
                        switch (funct7)
                        {
                            // srlw
                            case 0x00:
                                x[rd] = SignExtend(x[rs1] >> (x[rs2] & 0x1f), 32);
                                pc += 4;
                                break;
                            // sraw
                            case 0x20:
                                x[rd] = SignExtend((uint64_t)x[rs1] >> (x[rs2] & 0x1f), 32);
                                pc += 4;
                                break;
                        }
                        break;
                }
                break;
            case 0x63:
                switch (funct3)
                {
                    // beq 
                    case 0x0:
                        if (x[rs1] == x[rs2]) pc += imm__b_type;
                        else pc += 4;
                        break;
                    // bne 
                    case 0x1:
                        if (x[rs1] != x[rs2]) pc += imm__b_type;
                        else pc += 4;
                        break;
                    // blt 
                    case 0x4:
                        if ((int64_t)x[rs1] < (int64_t)x[rs2]) pc += imm__b_type;
                        else pc += 4;
                        break;
                    // bge 
                    case 0x5:
                        if ((int64_t)x[rs1] >= (int64_t)x[rs2]) pc += imm__b_type;
                        else pc += 4;
                        break;
                    // bltu 
                    case 0x6:
                        if (x[rs1] < x[rs2]) pc += imm__b_type;
                        else pc += 4;
                        break;
                    // bgeu 
                    case 0x7:
                        if (x[rs1] >= x[rs2]) pc += imm__b_type;
                        else pc += 4;
                        break;
                }
                break;
            case 0x67:
                switch (funct3)
                {
                    // jalr
                    case 0x0:
                        x[rd] = pc + 4;
                        pc = x[rs1] + imm__i_type;
                        break;
                }
                break;
            // jal
            case 0x6f:
                x[rd] = pc + 4;
                pc += imm__j_type;
                break;
            case 0x73:
                switch (funct3)
                {
                    case 0x0:
                        switch (Field(ir, 20, 12))
                        {
                            // ecall
                            case 0x000:
                                break;
                            // ebreak
                            case 0x001:
                                break;
                        }
                        break;
                }
                break;
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
        data |= (uint64_t)mem[addr + i] << (8*i);
    } 

    return data;
}

//==============================================
// Store 
//==============================================
void Bluejay::Store(uint64_t data, uint64_t addr, uint8_t size)
{
    for (int i = 0; i < size; i++) 
    {
        mem[addr + i] = (uint8_t)((data >> (8*i)) & 0xff);
    } 
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
