# Autogenerated wrapper script for libdivsufsort_jll for x86_64-w64-mingw32
export libdivsufsort

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libdivsufsort`
const libdivsufsort_splitpath = ["bin", "libdivsufsort.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libdivsufsort_path = ""

# libdivsufsort-specific global declaration
# This will be filled out by __init__()
libdivsufsort_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libdivsufsort = "libdivsufsort.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"libdivsufsort")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libdivsufsort_path = normpath(joinpath(artifact_dir, libdivsufsort_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libdivsufsort_handle = dlopen(libdivsufsort_path)
    push!(LIBPATH_list, dirname(libdivsufsort_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

