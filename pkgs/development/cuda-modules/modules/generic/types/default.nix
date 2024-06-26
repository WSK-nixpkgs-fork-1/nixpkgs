{ lib, ... }:
let
  inherit (lib) options types;
in
{
  options.generic.types = options.mkOption {
    type = types.attrsOf types.optionType;
    default = { };
    description = "Set of generic types";
  };
  config.generic.types = {
    cudaArch = types.strMatching "^sm_[[:digit:]]+[a-z]?$" // {
      name = "cudaArch";
      description = "CUDA architecture name";
    };
    # https://github.com/ConnorBaker/cuda-redist-find-features/blob/c841980e146f8664bbcd0ba1399e486b7910617b/cuda_redist_find_features/types/_lib_so_name.py
    libSoName = types.strMatching ".*\\.so(\\.[[:digit:]]+)*$" // {
      name = "libSoName";
      description = "Name of a shared object file";
    };

    majorMinorVersion = types.strMatching "^([[:digit:]]+)\\.([[:digit:]]+)$" // {
      name = "majorMinorVersion";
      description = "Version number with a major and minor component";
    };

    majorMinorPatchVersion = types.strMatching "^([[:digit:]]+)\\.([[:digit:]]+)\\.([[:digit:]]+)$" // {
      name = "majorMinorPatchVersion";
      description = "Version number with a major, minor, and patch component";
    };

    majorMinorPatchBuildVersion =
      types.strMatching "^([[:digit:]]+)\\.([[:digit:]]+)\\.([[:digit:]]+)\\.([[:digit:]]+)$"
      // {
        name = "majorMinorPatchBuildVersion";
        description = "Version number with a major, minor, patch, and build component";
      };
  };
}
