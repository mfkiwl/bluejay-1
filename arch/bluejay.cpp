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
    uint32_t ir;

    Bluejay();
    void Run();
    uint64_t Load(uint64_t addr, uint8_t size);
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

//==============================================
// Run 
//==============================================
void Bluejay::Run()
{
    std::cout << "Run\n";

    
    while (1) {
        // load instruction      
        ir = (uint32_t)Load(pc, 4);
        std::cout << std::hex << ir << std::endl; 
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
