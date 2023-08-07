configfile: "config.yaml"

top = "/Users/seankent/Documents/bluejay"
jconfig = {}

jconfig["modules"] = {}

jconfig["modules"]["d_flip_flop"] = {}
jconfig["modules"]["d_flip_flop"]["deps"] = {}
jconfig["modules"]["d_flip_flop"]["b"] = f"{top}/ip/lib/src" 
jconfig["modules"]["d_flip_flop"]["sv"] = f"{top}/ip/lib/src/gen" 

jconfig["modules"]["jay"] = {} 
jconfig["modules"]["jay"]["deps"] = {"d_flip_flop", "jay__decoder", "jay__register_file"}
jconfig["modules"]["jay"]["b"] = f"{top}/ip/jay/src"
jconfig["modules"]["jay"]["sv"] = f"{top}/ip/jay/src/gen"

jconfig["modules"]["jay__decoder"] = {} 
jconfig["modules"]["jay__decoder"]["deps"] = {}
jconfig["modules"]["jay__decoder"]["b"] = f"{top}/ip/jay/src"
jconfig["modules"]["jay__decoder"]["sv"] = f"{top}/ip/jay/src/gen"

jconfig["modules"]["jay__register_file"] = {} 
jconfig["modules"]["jay__register_file"]["deps"] = {}
jconfig["modules"]["jay__register_file"]["b"] = f"{top}/ip/jay/src"
jconfig["modules"]["jay__register_file"]["sv"] = f"{top}/ip/jay/src/gen"


###########
# Builder #
###########
class Builder:
    ############
    # __init__ #
    ############
    def __init__(self, defs = {}):
        """
        Builder constructor. 
        
        Arguments:
            defs (dict): A hash of defines. 
        """
        self.defs = copy.deepcopy(defs)

    def get_deps(self, wildcards):
        print(wildcards)
        print(type(wildcards))
        print(vars(wildcards))
        print(wildcards["mod"])
        deps = []
        for module in jconfig["modules"][wildcards["mod"]]["deps"]:
            deps.append(get_sv(module))
        return deps


builder = Builder()

def get_sv(mod):
    return jconfig["modules"][mod]["sv"] + "/" + mod + ".sv"


def get_sv(mod):
    return jconfig["modules"][mod]["sv"] + "/" + mod + ".sv"


def get_deps(wildcards):
    print(wildcards)
    print(type(wildcards))
    print(vars(wildcards))
    print(wildcards["mod"])
    deps = []
    for module in jconfig["modules"][wildcards["mod"]]["deps"]:
        deps.append(get_sv(module))
    return deps

rule all:
    input:
        b = f"{top}/ip/jay/src/gen/jay.sv"

rule sim:
    input:
        builder.get_deps
    output:
        "sim_{mod}_{suffix}.txt"
    shell:
        "touch {output}"



rule bluejay_to_system_verilog:
    input:
        b = "{dir}/{module}.b",
        defs = f"{top}/defs/gen/defs.py"
    output:
        sv = "{dir}/{gen}/{module}.sv" 
    shell:
        "python3 tools/bluejay.py {input.b} {output.sv} {input.defs}"
