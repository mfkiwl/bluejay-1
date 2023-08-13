TOP = "/home/seankent/bluejay"



#import jaymake
from jaymake import jm

rule:
    input:
       "ip/jay/src/gen/jay.sv" 

rule:
    input:
        bluejay_file = "{dir}/{module}.b",
        defs = "defs/gen/defs.py"
    output:
        system_verilog_file = "{dir}/gen/{module}.sv" 
    shell:
        "python3 tools/bluejay.py {input.bluejay_file} {output.system_verilog_file} {input.defs}"

rule:
    input:
        "defs/defs.py"
    output:
        "defs/gen/defs.py" 
    shell:
        "python3 tools/builder.py {input} {output} sv"

rule:
    input:
        system_verilog_files = jm.snakemake_get_all_system_verilog_files,
        tb_files = jm.snakemake_get_tb_files
    output:
        touch("ip/{ip}/sim/{dut}/gen/{run}/xvlog.done")
    params:
        xvlog_opts = "--sv --incr"
    shell:
        """
        mkdir -p ip/{wildcards.ip}/sim/{wildcards.dut}/gen/{wildcards.run}
        cd ip/{wildcards.ip}/sim/{wildcards.dut}/gen/{wildcards.run} ; xvlog {params.xvlog_opts} {input.system_verilog_files} {input.tb_files}
        """

rule:
    input:
        "ip/{ip}/sim/{dut}/gen/{run}/xvlog.done"
    output:
        touch("ip/{ip}/sim/{dut}/gen/{run}/xelab.done")
    params:
        xelab_opts = "",
        tb_top = jm.snakemake_get_tb_top,
        snapshot = "snapshot" 
    shell: 
	    # $(CD) $(TOP)/ip/$(1)/sim/gen/$(2) ; $(XELAB) -debug all $(XELAB__OPTS) -top tb -snapshot $(SNAPSHOT) 
        """
        cd ip/{wildcards.ip}/sim/{wildcards.dut}/gen/{wildcards.run} ; xelab {params.xelab_opts} -top {params.tb_top} -snapshot {params.snapshot}
        """

rule:
    input:
        S = "ip/jay/sim/jay/tests/{test}/{test}.S"
    output:
        elf = "ip/jay/sim/jay/tests/{test}/gen/{test}.elf"
    params:
        riscv_gcc_opts = "-march=rv64i -mabi=lp64 -DXLEN=64 -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles"
    shell: 
        """
        riscv64-unknown-elf-gcc {params.riscv_gcc_opts} -I imperas/imperas-riscv-tests/riscv-test-suite/env -I imperas/imperas-riscv-tests/riscv-target/riscvOVPsimPlus -T imperas/imperas-riscv-tests/riscv-target/riscvOVPsimPlus/link.ld {input.S} -o {output.elf}
        """

rule:
    input:
        elf = "ip/jay/sim/jay/tests/{test}/gen/{test}.elf"
    output:
        lst = "ip/jay/sim/jay/tests/{test}/gen/{test}.lst"
    shell: 
        """
	    riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr {input.elf} > {output.lst}
        """

rule:
    input:
        elf = "ip/jay/sim/jay/tests/{test}/gen/{test}.elf"
    output:
        bin = "ip/jay/sim/jay/tests/{test}/gen/{test}.bin"
    shell: 
        """
	    riscv64-unknown-elf-objcopy {input.elf} -O binary {output.bin}
        """

rule:
    input:
        bin = "ip/jay/sim/jay/tests/{test}/gen/{test}.bin"
    output:
        mem = "ip/jay/sim/jay/tests/{test}/gen/{test}.mem"
    shell: 
        """
	    od -t x1 -An -w1 -v {input.bin} > {output.mem}
        """


rule:
    input:
        elf = "ip/jay/sim/jay/tests/{test}/gen/{test}.elf"
    output:
        signature = "ip/jay/sim/jay/tests/{test}/gen/signature"
    params:
        target_sim = "imperas/imperas-riscv-tests/riscv-ovpsim-plus/bin/Linux64/riscvOVPsimPlus.exe",
        target_flags = "",
        coverenable = "",
        log =  "ip/jay/sim/jay/tests/{test}/gen/{test}.log",
        redir = ">/dev/null"
    shell: 
        """
        {params.target_sim} {params.target_flags} --variant RV64I --override riscvOVPsim/cpu/tval_ii_code=F --program {input.elf} --signaturedump --customcontrol {params.coverenable} --override riscvOVPsim/cpu/sigdump/SignatureFile={output.signature} --override riscvOVPsim/cpu/sigdump/SignatureGranularity=4 --override riscvOVPsim/cpu/simulateexceptions=T --override riscvOVPsim/cpu/defaultsemihost=F --logfile {params.log} --override riscvOVPsim/cpu/user_version=2.3 {params.redir}
        """


#TARGET_SIM := $(TOP)/imperas/imperas-riscv-tests/riscv-ovpsim-plus/bin/Linux64/riscvOVPsimPlus.exe
#RISCV_TARGET_FLAGS :=
#REDIR  := >/dev/null
##COVERENABLE=\
##        --startcover rvtest_code_begin --finishcover rvtest_code_end \
##        --cover $(COVERTYPE) \
##        --extensions I \
##        --outputfile $(*).$(COVERTYPE).coverage.yaml
#
##(call run-target,test,dir)
#define run-target
#$(TARGET_SIM) $(TARGET_FLAGS) --variant RV64I --override riscvOVPsim/cpu/tval_ii_code=F --program $(2)/$(1).elf --signaturedump --customcontrol $(COVERENABLE) --override riscvOVPsim/cpu/sigdump/SignatureFile=$(2)/$(1).signature.output --override riscvOVPsim/cpu/sigdump/SignatureGranularity=4 --override riscvOVPsim/cpu/simulateexceptions=T --override riscvOVPsim/cpu/defaultsemihost=F --logfile $(2)/$(1).log --override riscvOVPsim/cpu/user_version=2.3 $(REDIR)
#endef


