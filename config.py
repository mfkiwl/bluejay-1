
top = "/Users/seankent/Documents/bluejay"
jconfig = {}

jconfig["modules"] = {}

jconfig["modules"]["d_flip_flop"] = {}
jconfig["modules"]["d_flip_flop"]["deps"] = {}
jconfig["modules"]["d_flip_flop"]["b"] = f"{top}/ip/lib/src" 
jconfig["modules"]["d_flip_flop"]["sv"] = f"{top}/ip/lib/gen" 

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



def get_sv(mod):
    return jconfig["modules"][mod]["sv"] + "/" + mod + ".sv"


def get_deps(mod):
    deps = []
    for module in jconfig["modules"][mod]["deps"]:
        deps.append(get_sv(module))
    return deps

print(get_deps("jay"))

