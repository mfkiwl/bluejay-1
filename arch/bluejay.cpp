//==============================================
// include 
//==============================================
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <iomanip>

//==============================================
// define 
//==============================================
#define MEMORY__SIZE 32768 
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
#define REG__RA 1
#define REG__SP 2
#define REG__GP 3
#define REG__A0 10



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
    void Reset();
    void LoadMemory(std::string filename);
    void Run();
    uint64_t Load(uint64_t addr, uint8_t size);
    void Store(uint64_t data, uint64_t addr, uint8_t size);
    uint64_t Field(uint64_t data, uint64_t lsb, uint64_t width);
    uint64_t SignExtend(uint64_t data, uint64_t width);

    uint64_t Read(uint64_t rs);
    void Write(uint64_t rd, uint64_t data);


    void PrintMemory();
    void PrintRegs();
};


//==============================================
// Bluejay (Constructor)
//==============================================
Bluejay::Bluejay()
{
    Reset();
}

//==============================================
// Reset 
//==============================================
void Bluejay::Reset()
{
    x[0] = 0x0;
    pc = 0x0;
}

//==============================================
// PrintRegs 
//==============================================
void Bluejay::PrintRegs()
{
    std::cout << "zero: 0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[0] << std::endl; 
    std::cout << "ra:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[1] << std::endl; 
    std::cout << "sp:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[2] << std::endl; 
    std::cout << "gp:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[3] << std::endl; 
    std::cout << "tp:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[4] << std::endl; 
    std::cout << "t0:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[5] << std::endl; 
    std::cout << "t1:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[6] << std::endl; 
    std::cout << "t2:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[7] << std::endl; 
    std::cout << "s0:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[8] << std::endl; 
    std::cout << "s1:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[9] << std::endl; 
    std::cout << "a0:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[10] << std::endl; 
    std::cout << "a1:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[11] << std::endl; 
    std::cout << "a2:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[12] << std::endl; 
    std::cout << "a3:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[13] << std::endl; 
    std::cout << "a4:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[14] << std::endl; 
    std::cout << "a5:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[15] << std::endl; 
    std::cout << "a6:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[16] << std::endl; 
    std::cout << "a7:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[17] << std::endl; 
    std::cout << "s2:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[18] << std::endl; 
    std::cout << "s3:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[19] << std::endl; 
    std::cout << "s4:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[20] << std::endl; 
    std::cout << "s5:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[21] << std::endl; 
    std::cout << "s6:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[22] << std::endl; 
    std::cout << "s7:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[23] << std::endl; 
    std::cout << "s8:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[24] << std::endl; 
    std::cout << "s9:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[25] << std::endl; 
    std::cout << "s10:  0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[26] << std::endl; 
    std::cout << "s11:  0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[27] << std::endl; 
    std::cout << "t3:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[28] << std::endl; 
    std::cout << "t4:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[29] << std::endl; 
    std::cout << "t5:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[30] << std::endl; 
    std::cout << "t6:   0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << x[31] << std::endl; 
}

//==============================================
// LoadMemory
//==============================================
void Bluejay::LoadMemory(std::string filename)
{

    std::ifstream file(filename);
    std::string line;

    uint64_t addr = 0;
    uint64_t data;

    if (file.is_open())
    {

        while (getline(file, line))
        {
            if (addr >= MEMORY__SIZE) 
            {
                std::cout << "[ERROR] Memory Limit Reached.\n";
            }
            data = std::stoul(line, nullptr, 16);
            Store(data, addr, 4);
            addr += 4;
        }
        file.close();
    }
    else std::cout << "[ERROR] Unable to open file.\n";
}



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
    while (1) 
    {
        // load instruction      
        uint64_t ir = Load(pc, 4);
     
        // decode instruction
        uint64_t opcode = Field(ir, IR__OPCODE__LSB, IR__OPCODE__WIDTH);
        uint64_t rd = Field(ir, IR__RD__LSB, IR__RD__WIDTH);
        uint64_t funct3 = Field(ir, IR__FUNCT3__LSB, IR__FUNCT3__WIDTH);
        uint64_t rs1 = Field(ir, IR__RS1__LSB, IR__RS1__WIDTH);
        uint64_t rs2 = Field(ir, IR__RS2__LSB, IR__RS2__WIDTH);
        uint64_t funct7 = Field(ir, IR__FUNCT7__LSB, IR__FUNCT7__WIDTH);
        uint64_t imm__i_type = SignExtend(Field(ir, 20, 12), 12);
        uint64_t imm__s_type = SignExtend((Field(ir, 25, 7) << 5) | Field(ir, 7, 5), 12);
        uint64_t imm__b_type = SignExtend((Field(ir, 31, 1) << 12) | (Field(ir, 7, 1) << 11) | (Field(ir, 25, 6) << 5) | (Field(ir, 8, 4) << 1), 13);
        uint64_t imm__u_type = SignExtend(Field(ir, 12, 20) << 12, 32);
        uint64_t imm__j_type = SignExtend((Field(ir, 31, 1) << 20) | (Field(ir, 12, 8) << 12) | (Field(ir, 20, 1) << 11) | (Field(ir, 21, 10) << 1), 21);
              

        //std::cout << "pc: " << std::hex << pc << std::endl; 
        //std::cout << "ir: " << std::hex << ir << std::endl; 
        //std::cout << "opcode: " << std::hex << opcode << std::endl; 
        //std::cout << "rd: " << std::hex << rd << std::endl; 
        //std::cout << "funct3: " << std::hex << funct3 << std::endl; 
        //std::cout << "rs1: " << std::hex << rs1 << std::endl; 
        //std::cout << "rs2: " << std::hex << rs2 << std::endl; 
        //std::cout << "funct7: " << std::hex << funct7 << std::endl; 

        // execute instruction
        switch (opcode)
        {
            case 0x03:
                switch (funct3)
                {
                    // lb
                    case 0x0:
                        if (rd != 0) x[rd] = SignExtend(Load(x[rs1] + imm__i_type, 1), 8);
                        pc += 4;
                        break;
                    // lh
                    case 0x1:
                        if (rd != 0) x[rd] = SignExtend(Load(x[rs1] + imm__i_type, 2), 16);
                        pc += 4;
                        break;
                    // lw
                    case 0x2:
                        if (rd != 0) x[rd] = SignExtend(Load(x[rs1] + imm__i_type, 4), 32);
                        pc += 4;
                        break;
                    // ld
                    case 0x3:
                        if (rd != 0) x[rd] = Load(x[rs1] + imm__i_type, 8);
                        pc += 4;
                        break;
                    // lbu
                    case 0x4:
                        if (rd != 0) x[rd] = Load(x[rs1] + imm__i_type, 1);
                        pc += 4;
                        break;
                    // lhu 
                    case 0x5:
                        if (rd != 0) x[rd] = Load(x[rs1] + imm__i_type, 2);
                        pc += 4;
                        break;
                    // lwu 
                    case 0x6:
                        if (rd != 0) x[rd] = Load(x[rs1] + imm__i_type, 4);
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
                        if (rd != 0) x[rd] = x[rs1] + imm__i_type;
                        pc += 4;
                        break;
                    case 0x1:
                        switch (funct7)
                        {
                            // slli
                            case 0x0:
                                if (rd != 0) x[rd] = x[rs1] << (imm__i_type & 0x1f);
                                pc += 4;
                                break; 
                        }
                        break;
                    // slti
                    case 0x2:
                        if (rd != 0) x[rd] = (int64_t)x[rs1] < (int64_t)imm__i_type;
                        pc += 4;
                        break;
                    // sltiu
                    case 0x3:
                        if (rd != 0) x[rd] = x[rs1] < imm__i_type;
                        pc += 4;
                        break;
                    // xori
                    case 0x4:
                        if (rd != 0) x[rd] = x[rs1] ^ imm__i_type;
                        pc += 4;
                        break;
                    case 0x5:
                        switch (funct7)
                        {
                            // srli
                            case 0x00:
                                if (rd != 0) x[rd] = x[rs1] >> (imm__i_type & 0x1f);
                                pc += 4;
                                break;
                            // srai
                            case 0x20:
                                if (rd != 0) x[rd] = (int64_t)x[rs1] >> (imm__i_type & 0x1f);
                                pc += 4;
                                break;
                        }
                        break;
                    // ori
                    case 0x6:
                        if (rd != 0) x[rd] = x[rs1] | imm__i_type;
                        pc += 4;
                        break;
                    // andi 
                    case 0x7:
                        if (rd != 0) x[rd] = x[rs1] & imm__i_type;
                        pc += 4;
                        break;
                }
                break;
            // auipc
            case 0x17:
                if (rd != 0) x[rd] = pc + imm__u_type;
                pc += 4;
                break;
            case 0x1b:
                switch (funct3)
                {
                    // addiw
                    case 0x0:
                        if (rd != 0) x[rd] = SignExtend(x[rs1] + imm__i_type, 32);
                        pc += 4;
                        break;
                    case 0x1:
                        switch (funct7)
                        {
                            // slliw
                            case 0x00:
                                if (rd != 0) x[rd] = SignExtend(x[rs1] << (imm__i_type & 0x1f), 32);
                                pc += 4;
                                break; 
                        }
                        break;
                    case 0x5:
                        switch (funct7)
                        {
                            // srliw
                            case 0x00:
                                if (rd != 0) x[rd] = SignExtend(x[rs1] >> (imm__i_type & 0x1f), 32);
                                pc += 4;
                                break; 
                            // sraiw
                            case 0x20:
                                if (rd != 0) x[rd] = SignExtend((int64_t)x[rs1] >> (imm__i_type & 0x1f), 32);
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
                                if (rd != 0) x[rd] = (int64_t)x[rs1] + (int64_t)x[rs2];
                                pc += 4;
                                break;
                            // sub 
                            case 0x20:
                                if (rd != 0) x[rd] = (int64_t)x[rs1] - (int64_t)x[rs2];
                                pc += 4;
                                break;
                        }
                        break;
                    case 0x1:
                        switch (funct7)
                        {
                            // sll
                            case 0x00:
                                if (rd != 0) x[rd] = x[rs1] << (x[rs2] & 0x1f);
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x2:
                        switch (funct7)
                        {
                            // slt 
                            case 0x00:
                                if (rd != 0) x[rd] = (int64_t)x[rs1] < (int64_t)x[rs2];
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x3:
                        switch (funct7)
                        {
                            // sltu 
                            case 0x00:
                                if (rd != 0) x[rd] = x[rs1] < x[rs2];
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x4:
                        switch (funct7)
                        {
                            // xor 
                            case 0x00:
                                if (rd != 0) x[rd] = x[rs1] ^ x[rs2];
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x5:
                        switch (funct7)
                        {
                            // srl 
                            case 0x00:
                                if (rd != 0) x[rd] = x[rs1] >> (x[rs2] & 0x1f);
                                pc += 4;
                                break;
                            // sra 
                            case 0x20:
                                if (rd != 0) x[rd] = (uint64_t)x[rs1] >> (x[rs2] & 0x1f);
                                pc += 4;
                                break;
                        }
                        break; 
                    case 0x6:
                        switch (funct7)
                        {
                            // or 
                            case 0x00:
                                if (rd != 0) x[rd] = x[rs1] | x[rs2];
                                pc += 4;
                                break;
                        }
                        break;
                    case 0x7:
                        switch (funct7)
                        {
                            // and 
                            case 0x00:
                                if (rd != 0) x[rd] = x[rs1] & x[rs2];
                                pc += 4;
                                break;
                        }
                        break;
                }
                break;
            // lui 
            case 0x37:
                if (rd != 0) x[rd] = imm__u_type;
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
                                if (rd != 0) x[rd] = SignExtend(x[rs1] + x[rs2], 32);
                                pc += 4;
                                break;
                            // subw
                            case 0x20:
                                if (rd != 0) x[rd] = SignExtend(x[rs1] - x[rs2], 32);
                                pc += 4;
                                break;
                        }
                        break;
                    case 0x1:
                        switch (funct7)
                        {
                            // sllw
                            case 0x00:
                                if (rd != 0) x[rd] = SignExtend(x[rs1] << (x[rs2] & 0x1f), 32);
                                pc += 4;
                                break;
                        }
                        break;
                    case 0x5:
                        switch (funct7)
                        {
                            // srlw
                            case 0x00:
                                if (rd != 0) x[rd] = SignExtend(x[rs1] >> (x[rs2] & 0x1f), 32);
                                pc += 4;
                                break;
                            // sraw
                            case 0x20:
                                if (rd != 0) x[rd] = SignExtend((uint64_t)x[rs1] >> (x[rs2] & 0x1f), 32);
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
                        if (rd != 0) x[rd] = pc + 4;
                        pc = x[rs1] + imm__i_type;
                        break;
                }
                break;
            // jal
            case 0x6f:
                if (rd != 0) x[rd] = pc + 4;
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
                                return;
                                break;
                            // ebreak
                            case 0x001:
                                return;
                                break;
                        }
                        break;
                }
                break;
        }
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
// Store 
//==============================================
void Bluejay::Store(uint64_t data, uint64_t addr, uint8_t size)
{
    for (int i = 0; i < size; i++) 
    {
        memory[addr + i] = (uint8_t)((data >> (8*i)) & 0xff);
    } 
}



//==============================================
// Sim 
//==============================================
class Sim 
{
public:
    Bluejay bluejay;

public:
    void Run(std::string filename);
    void WriteResult(std::string filename);
};

//==============================================
// Run 
//==============================================
void Sim::Run(std::string filename)
{
    // reset bluejay 
    bluejay.Reset();

    // load memory
    bluejay.LoadMemory(filename);

    // run simulation
    bluejay.Run();

    std::cout << "a0: 0x" << std::setfill('0') << std::setw(16) << std::right << std::hex << bluejay.x[REG__A0] << std::endl; 
}

//==============================================
// Run 
//==============================================
void Sim::WriteResult(std::string filename)
{
    std::ofstream file(filename);
    std::string line;

    if (file.is_open())
    {
        file << std::setfill('0') << std::setw(16) << std::right << std::hex << bluejay.x[REG__A0] << std::endl; 
        file.close();
    }
    else std::cout << "[ERROR] Unable to open file.\n";
}

//==============================================
// main
//==============================================
int main()
{
    Sim sim;

    sim.Run("/mnt/c/Users/seanj/Documents/bluejay/sim/asm/basic/addi.txt");
    sim.WriteResult("addi.yyy");

    sim.Run("/mnt/c/Users/seanj/Documents/bluejay/sim/asm/basic/add.txt");
    sim.WriteResult("add.yyy");
    return 0; 
}
