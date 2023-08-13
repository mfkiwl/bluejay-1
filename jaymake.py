
top = "/Users/seankent/Documents/bluejay"
TOP = "/home/seankent/bluejay"


###########
# Jaymake #
###########
class Jaymake:
    ############
    # __init__ #
    ############
    def __init__(self):
        """
        """
        self.config = {}

    ###############################
    # get_ip_system_verilog_files #
    ###############################
    def get_ip_system_verilog_files(self, ip):
        """
        """
        system_verilog_files = set() 

        for module in self.config["ip"][ip]["src"]:
            system_verilog_files.add(f"{TOP}/ip/{ip}/src/gen/{module}.sv")

        return system_verilog_files 


    ################################
    # get_all_system_verilog_files #
    ################################
    def get_all_system_verilog_files(self, ip):
        """
        """
        system_verilog_files = self.get_ip_system_verilog_files(ip) 

        for ip_dependancy in self.config["ip"][ip]["deps"]:
            system_verilog_files = system_verilog_files.union(self.get_all_system_verilog_files(ip_dependancy))

        return system_verilog_files 

    ##############
    # get_tb_top #
    ##############
    def get_tb_top(self, ip, dut):
        """
        """
        return jm.config["ip"][ip]["sim"][dut]["tb_top"]

    ################
    # get_tb_files #
    ################
    def get_tb_files(self, ip, dut):
        """
        """
        tb_files = set() 

        for module in self.config["ip"][ip]["sim"][dut]["tb"]:
            tb_files.add(f"{TOP}/ip/{ip}/sim/{dut}/tb/gen/{module}.sv")

        return tb_files 

    ########################
    # snakemake_get_tb_top #
    ########################
    def snakemake_get_tb_top(self, wildcards):
        """
        """
        return self.get_tb_top(wildcards["ip"], wildcards["dut"])

    ########################
    # snakemake_get_tb_top #
    ########################
    def snakemake_get_tb_files(self, wildcards):
        """
        """
        return list(self.get_tb_files(wildcards["ip"], wildcards["dut"]))

    ##########################################
    # snakemake_get_all_system_verilog_files #
    ##########################################
    def snakemake_get_all_system_verilog_files(self, wildcards):
        """
        """
        return list(self.get_all_system_verilog_files(wildcards["ip"]))




jm = Jaymake()

jm.config["ip"] = {}
jm.config["ip"]["jay"] = {}
jm.config["ip"]["jay"]["src"] = {}
jm.config["ip"]["jay"]["src"] = {"jay", "jay__decoder", "jay__register_file", "jay__arithmetic_logic_unit", "jay__comparator", "jay__control_and_status_registers", "jay__marchid", "jay__mcause", "jay__mcycle", "jay__medeleg", "jay__mepc", "jay__mhartid", "jay__mhpmcounter", "jay__mhpmevent", "jay__mideleg", "jay__mie", "jay__mimpid", "jay__minstret", "jay__mip", "jay__misa", "jay__mscratch", "jay__mstatus", "jay__mtval", "jay__mtvec", "jay__mvendorid"}
jm.config["ip"]["jay"]["deps"] = {"lib"}

jm.config["ip"]["jay"]["sim"] = {}
jm.config["ip"]["jay"]["sim"]["jay"] = {}
jm.config["ip"]["jay"]["sim"]["jay"]["tb"] = {"tb", "memory"}
jm.config["ip"]["jay"]["sim"]["jay"]["tb_top"] = "tb"
jm.config["ip"]["jay"]["sim"]["jay"]["tests"] = {"ADD-01"}

jm.config["ip"]["lib"] = {}
jm.config["ip"]["lib"]["src"] = {}
jm.config["ip"]["lib"]["src"]["d_flip_flop"] = {}
jm.config["ip"]["lib"]["deps"] = {}


#jm.config["ip"] = {}
#jm.config["ip"]["jay"] = {}
#jm.config["ip"]["jay"]["src"] = {}
#jm.config["ip"]["jay"]["src"] = {"jay", "jay__decoder"}
#jm.config["ip"]["jay"]["deps"] = {"lib"}
#
#jm.config["ip"]["jay"]["sim"] = {}
#jm.config["ip"]["jay"]["sim"]["jay"] = {}
#jm.config["ip"]["jay"]["sim"]["jay"]["tb"] = {"tb", "memory"}
#jm.config["ip"]["jay"]["sim"]["jay"]["tests"] = {"ADD-01"}
#
#jm.config["ip"]["lib"] = {}
#jm.config["ip"]["lib"]["src"] = {}
#jm.config["ip"]["lib"]["src"]["d_flip_flop"] = {}
#jm.config["ip"]["lib"]["deps"] = {}

#print(jm.get_sv("jay"))
#print(jm.get_all_sv("jay"))

#jm.config = jconfig
#
#
#jm = JayMake()
#
#jm.config = jconfig
#
#print(jm.config)
#print(jm.get_module_deps("jay"))
#print(jm.get_test_deps("jay", "ADD-01"))
#
#
#jm.config["src"]["jay"]
#jm.config["ip"]["jay"]
#
#jm.config["ip"]["jay"]["src"] = {}
#jm.config["ip"]["jay"]["deps"] = {"lib"}
#jm.config["ip"]["jay"]["tb"]
#jm.config["ip"]["jay"]["sim"]
#
#jm.config["ip"]["jay"]["src"]["jay"]
#
#
#jm.config["ip"]["jay"]["src"]["jay"] = {}
#jm.config["ip"]["jay"]["src"]["jay"]["sub"] = {"jay__decoder"}
#
#
#
#jm.config["ip"]["jay"]["sim"]
#
#jm.config["ip"]["jay"]["jay"]
#jm.config["ip"]["jay"]["jay"]["sim"]["tests"]["ADD-01"]
#
#jm.config["ip"]["jay"]["jay"]["sim"]["tb"] = {"jay__tb", "jay__tb__memory"}
#jm.config["ip"]["jay"]["jay__decoder"]["deps"][""]["test_ab"] = {}
#
#jm.config["ip"]["jay"]["jay__decoder"]["sim"]["tests"]["test_ab"] = {}
#jm.config["ip"]["jay"]["jay__decoder"]["sim"]["tests"]["test_ab"] = {}
#
#jm.config["ip"]["jay"]["jay__decoder"]
#jm.config["ip"]["jay"]["jay__decoder"]
#jm.config["ip"]["jay"]["jay__decoder"]["sim"]["tests"][""]
#jm.config["ip"]["jay"]["jay__decoder"]["sim"]["tb"] = {"", ""}
#jm.config["ip"]["jay"]["jay__decoder"]["sim"]["tests"]["test_ab"] = {}
#
#
#jm.config["ip"]["jay"][""]
#jm.config["ip"]["jay"]["sim"]
#
#
#jconfig = {}
#
#jconfig["top"] = "/Users/seankent/Documents/bluejay"
#
#jconfig["ip"] = {}
#
#jconfig["ip"]["jay"] = {}
#jconfig["ip"]["jay"]["src"] = {"jay", "jay__decoder", "jay__register_file"}
#jconfig["ip"]["jay"]["tb"] = {"tb", "memory"}
#
#jconfig["ip"]["jay"]["src"] = {"jay", "jay__decoder", "jay__register_file"}
#jconfig["ip"]["jay"]["tb"] = {"tb", "memory"}
#jconfig["ip"]["jay"]["deps"] = {"lib"}
#jconfig["ip"]["jay"]["sim"] = {}
#
#
#jconfig["ip"]["jay"] = {}
#
#jconfig["ip"]["jay__decoder"] = {}




