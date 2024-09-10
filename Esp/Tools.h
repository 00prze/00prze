// Created by Saudgl on 3/22/23.
#include "Includes.h"
typedef unsigned long kaddr;

namespace Tools
{
void Hook(void *target, void *replace, void **backup);

    bool Read(void *addr, void *buffer, size_t length);
    bool Write(void *addr, void *buffer, size_t length);
    bool ReadAddr(void *addr, void *buffer, size_t length);
    bool WriteAddr(void *addr, void *buffer, size_t length);

    bool PVM_ReadAddr(void *addr, void *buffer, size_t length);
    bool PVM_WriteAddr(void *addr, void *buffer, size_t length);

    bool IsPtrValid(void *addr);
    
    
    uintptr_t GetBaseAddress(const char *name);
    uintptr_t GetEndAddress(const char *name);
    uintptr_t FindPattern(const char *lib, const char* pattern);

    std::string RandomString(const int len);

    std::string CalcMD5(std::string s);
    std::string CalcSHA256(std::string s);
}
